//
//  UserPositionSearchViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/14.
//

import UIKit
import Lottie
import CoreLocation
import MapKit

class UserPositionSearchViewController: LottieAnimationViewController {
    
    var locationManager: CLLocationManager!
    /// ユーザー緯度
    static var userLatitude: CLLocationDegrees?
    /// ユーザー経度
    static var userLongitude: CLLocationDegrees?
    /// 日本電子の緯度
    let jecLatitude = 35.69888197640192
    /// 日本電子の経度
    let jecLongitude = 139.69659207804926
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLottieAnimation()
        setLocationManager()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        startLottieAnimation(name: "indicator", mode:.loop)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5, execute:{
            if self.isNearJEC() {
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
                self.show(loginViewController, sender: nil)
            } else {
                let storyboard = UIStoryboard(name: "MissUserSearch", bundle: nil)
                let missUserSearchViewController = storyboard.instantiateViewController(withIdentifier: "MissUserSearchViewController")
                self.show(missUserSearchViewController, sender: nil)
            }
        })
    }
    
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
    
    func isNearJEC() -> Bool {
        ///直線距離
        let userPoint: CLLocation = CLLocation(latitude: UserPositionSearchViewController.userLatitude ?? jecLatitude, longitude: UserPositionSearchViewController.userLongitude ?? jecLongitude)
        
        let jecPoint: CLLocation = CLLocation(latitude: jecLatitude, longitude: jecLongitude)
        
        let distance = jecPoint.distance(from: userPoint)
        
        if distance <= 50{
            return true
        } else {
            return false
        }
    }
}

extension UserPositionSearchViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                let location = locations.first
                UserPositionSearchViewController.userLatitude  = location?.coordinate.latitude
                UserPositionSearchViewController.userLongitude = location?.coordinate.longitude
        
        ///日本電子前の向こう側
        //        35.69904007597137, 139.69696172136653
        //        UserPositionSearchViewController.userLatitude  = 35.69904007597137
        //        UserPositionSearchViewController.userLongitude = 139.69696172136653
        
        ///新宿駅
        //        35.68978093742226, 139.70057130449362
        //        UserPositionSearchViewController.userLatitude  = 35.68978093742226
        //        UserPositionSearchViewController.userLongitude = 139.70057130449362
        
        ///Managerを一回だけ呼ぶ
        manager.stopUpdatingLocation()
        manager.delegate = nil
    }
    
    /// 認証ステータスが変更されるタイミングで呼ばれる
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
