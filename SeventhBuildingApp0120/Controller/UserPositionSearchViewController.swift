//
//  UserPositionSearchViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/14.
//

import UIKit
import Lottie
import CoreLocation

class UserPositionSearchViewController: LottieAnimationViewController {
    
    var locationManager: CLLocationManager!
    /// ユーザー緯度
    var userLatitude: Double?
    /// ユーザー経度
    var userLongitude: Double?
    /// 日本電子の緯度
    var jecLatitude = 35.698854
    /// 日本電子の経度
    var jecLongitude = 139.696603

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLottieAnimation()
        setLocationManager()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        startLottieAnimation(name: "indicator", mode:.loop)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute:{
//        MARK: - GPS
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
        let userLocation: CLLocation = CLLocation(latitude: userLatitude ?? jecLatitude, longitude: userLongitude ?? jecLongitude)
        let jecLocation: CLLocation = CLLocation(latitude: jecLatitude, longitude: jecLongitude)
        let distance = jecLocation.distance(from: userLocation)
        print(distance)
        if distance < 50.0 {
            return true
        } else {
            return false
        }
    }
}

extension UserPositionSearchViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        self.userLatitude  = location?.coordinate.latitude
        self.userLongitude = location?.coordinate.longitude
        
        print(userLatitude,userLongitude)
    }
    
    /// 認証ステータスが変更されるタイミングで呼ばれる
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
