//
//  MapViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit
import CoreLocation
import MapKit
import FloatingPanel

class MapViewController: UIViewController {
    
    var locationManager: CLLocationManager!
    /// 日本電子の緯度
    let jecLatitude = 35.69888197640192
    /// 日本電子の経度
    let jecLongitude = 139.69659207804926
    
    @IBOutlet weak var mapView: MKMapView!
    
    var fpc: FloatingPanelController!
    
    var halfModalVC: HalfModalViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLocationManager()
        setHalfModal()
        mapView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        self.title = "７号館に向かう"
    }
    
    private func setHalfModal(){
        fpc = FloatingPanelController()
        fpc.delegate = self
         
        halfModalVC = HalfModalViewController.fromStoryboard()
        fpc.set(contentViewController: halfModalVC)
        
        // モーダルを角丸にする
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 20.0
        fpc.surfaceView.appearance = appearance
        
        fpc.addPanel(toParent: self)
    }
    
    private func setMapkit(){
        
        let userPoint = CLLocationCoordinate2DMake(UserPositionSearchViewController.userLatitude ?? jecLatitude,UserPositionSearchViewController.userLongitude ?? jecLongitude)
    
        let jecPoint = CLLocationCoordinate2DMake(jecLatitude,jecLongitude)
        
        //中心座標：現在地と７号館との２点間の中心
        let center = middlePointOfListMarkers(listCoords: [userPoint,jecPoint])
        //表示範囲
        let span = makeSpan(userPoint: userPoint, jecPoint: jecPoint)
        //中心座標と表示範囲をマップに登録する
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated:true)
        // PlaceMarkを生成して出発点、目的地の座標をセット.
        let fromPlace: MKPlacemark = MKPlacemark(coordinate: userPoint, addressDictionary: nil)
        let toPlace: MKPlacemark = MKPlacemark(coordinate: jecPoint, addressDictionary: nil)
        // Itemを生成してPlaceMarkをセット.
        let fromItem: MKMapItem = MKMapItem(placemark: fromPlace)
        let toItem: MKMapItem = MKMapItem(placemark: toPlace)
        // MKDirectionsRequestを生成.
        let myRequest: MKDirections.Request = MKDirections.Request()
        // 出発地のItemをセット.
        myRequest.source = fromItem
        // 目的地のItemをセット.
        myRequest.destination = toItem
        // 複数経路の検索を有効.
        myRequest.requestsAlternateRoutes = true
        // 移動手段を徒歩に設定.
        myRequest.transportType = MKDirectionsTransportType.walking
        // MKDirectionsを生成してRequestをセット.
        let myDirections: MKDirections = MKDirections(request: myRequest)
        // 経路探索.
        myDirections.calculate { (response, error) in
            // NSErrorを受け取ったか、ルートがない場合.
            if error != nil || response!.routes.isEmpty {
                return
            }
            let route: MKRoute = response!.routes[0] as MKRoute
            self.halfModalVC?.walkingTimeLabel.text = "\(Int(route.expectedTravelTime/60))分"
            self.halfModalVC?.distanceLabel.text = "\(route.distance)m"
            
            print("MapView:\(route.distance)")
            
            // mapViewにルートを描画.
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
        }
        //ルートがマップに収まるように
        if let firstOverlay = self.mapView.overlays.first{
            let rect = self.mapView.overlays.reduce(firstOverlay.boundingMapRect, {$0.union($1.boundingMapRect)})
            self.mapView.setVisibleMapRect(rect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
        }
        // ピンを生成.
        let fromPin: MKPointAnnotation = MKPointAnnotation()
        let toPin: MKPointAnnotation = MKPointAnnotation()
        // 座標をセット.
        fromPin.coordinate = userPoint
        toPin.coordinate = jecPoint
        // titleをセット.
        fromPin.title = "出発地"
        toPin.title = "目的地"
        // mapViewに追加.
        mapView.addAnnotation(fromPin)
        mapView.addAnnotation(toPin)
    }
    
    ///比率調整
    func makeSpan(userPoint: CLLocationCoordinate2D, jecPoint: CLLocationCoordinate2D) -> MKCoordinateSpan{
        let points:[CLLocationCoordinate2D] = [userPoint, jecPoint]
        var minLat = 9999.0;
        var minLng = 9999.0;
        var maxLat = -9999.0;
        var maxLng = -9999.0;
        
        // ＼(^o^)／
        //   |  |
        //  「　　∟
        
        for point in points {
            let lat = point.latitude
            let lng = point.longitude
            //緯度の最大最小を求める
            if minLat > lat {
                minLat = lat;
            }
            if lat > maxLat {
                maxLat = lat;
            }
            //経度の最大最小を求める
            if minLng > lng {
                minLng = lng;
            }
            if lng > maxLng {
                maxLng = lng;
            }
        }
        return MKCoordinateSpan(latitudeDelta: (maxLat - minLat) / 0.8, longitudeDelta: (maxLng - minLng) / 0.8)
    }
    
    /// LocationManagerの設定
    private func setLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        checkLocationAuthorization()
    }
    
    /// 位置情報の認証状態を確認する
    private func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .denied, .notDetermined, .restricted:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
    }
    
    ///２点間の中心座標を計算する
    func middlePointOfListMarkers(listCoords: [CLLocationCoordinate2D]) -> CLLocationCoordinate2D{
        
        var x = 0.0 as CGFloat
        var y = 0.0 as CGFloat
        var z = 0.0 as CGFloat
        
        for coordinate in listCoords{
            
            let lat:CGFloat = degreeToRadian(angle: coordinate.latitude)
            let lon:CGFloat = degreeToRadian(angle: coordinate.longitude)
            x = x + cos(lat) * cos(lon)
            y = y + cos(lat) * sin(lon);
            z = z + sin(lat);
        }
        
        x = x/CGFloat(listCoords.count)
        
        y = y/CGFloat(listCoords.count)
        
        z = z/CGFloat(listCoords.count)
        let resultLon: CGFloat = atan2(y, x)
        let resultHyp: CGFloat = sqrt(x*x+y*y)
        let resultLat:CGFloat = atan2(z, resultHyp)
        let newLat = radianToDegree(radian: resultLat)
        let newLon = radianToDegree(radian: resultLon)
        let result:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: newLat, longitude: newLon)
        return result
    }
    
    // /** Degrees to Radian **/
    
    func degreeToRadian(angle:CLLocationDegrees) -> CGFloat{
        
        return ((CGFloat(angle)) / 180.0 * CGFloat(Double.pi))
    }
    
    // /** Radians to Degrees **/
    
    func radianToDegree(radian:CGFloat) -> CLLocationDegrees{
        
        return CLLocationDegrees(radian * CGFloat(180.0 / Double.pi))
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let location = locations.first
//        UserPositionSearchViewController.userLatitude  = location?.coordinate.latitude
//        UserPositionSearchViewController.userLongitude = location?.coordinate.longitude

        setMapkit()
        ///LocatinManagerを１回だけ呼ぶ
        manager.stopUpdatingLocation()
        manager.delegate = nil
    }
    /// 認証ステータスが変更されるタイミングで呼ばれる
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

extension MapViewController: MKMapViewDelegate {
    // ルートの表示設定.
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let route: MKPolyline = overlay as! MKPolyline
        let routeRenderer: MKPolylineRenderer = MKPolylineRenderer(polyline: route)
        // ルートの線の太さ.
        routeRenderer.lineWidth = 3.0
        // ルートの線の色.
        routeRenderer.strokeColor = UIColor.systemBlue
        return routeRenderer
    }
}

extension MapViewController: FloatingPanelControllerDelegate {
    
}


