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
    /// 緯度
    var latitude: Double?
    /// 経度
    var longitude: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLottieAnimation()
        setLocationManager()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        startLottieAnimation(name: "indicator", mode:.loop)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.show(loginViewController, sender: nil)
            
//            let storyboard = UIStoryboard(name: "MissUserSearch", bundle: nil)
//            let missUserSearchViewController = storyboard.instantiateViewController(withIdentifier: "MissUserSearchViewController")
//            self.show(missUserSearchViewController, sender: nil)
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
}


extension UserPositionSearchViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        self.latitude  = location?.coordinate.latitude
        self.longitude = location?.coordinate.longitude

        ///ユーザーの地図上での位置情報
        print(longitude,latitude)
    }
    
    /// 認証ステータスが変更されるタイミングで呼ばれる
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
