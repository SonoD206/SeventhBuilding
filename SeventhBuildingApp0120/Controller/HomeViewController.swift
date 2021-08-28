//
//  HomeViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit
import Lottie
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var currentLocationInfomationTableView: UITableView!
    @IBOutlet private weak var currentLocationMapImageView: UIImageView!
    
    @IBOutlet weak var lottieView: SettingLottieView!
    
    
    var locationManager: CLLocationManager!
    /// ユーザー緯度
    var userLatitude: Double?
    /// ユーザー経度
    var userLongitude: Double?
    
    ///WeatherAPIで取った今の気温
    var weatherNowTemp: Double?
    ///WeatherAPIで取った今の気圧
    var weatherPressure: Double?
    /// ユーザーのいる位置の気圧
    var userPressure: Double?
    
    var closeCellHeight: CGFloat = 98
    var openCellHeight: CGFloat = 352
    
    let foldingCellCount = 3
    ///FoldingCellの高さの配列
    var cellHeights: [CGFloat] = []
    
    /// 7号館のフロア情報を格納する配列
    static var floors: [Floor] = []
    
    var userCurrentNumIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellHeights = Array.init(repeating: closeCellHeight, count: foldingCellCount)
        
        currentLocationInfomationTableView.delegate = self
        currentLocationInfomationTableView.dataSource = self
        
        weatherNowTemp = UserDefaults.standard.double(forKey: "temp")
        weatherPressure = UserDefaults.standard.double(forKey: "pressure")
        
        ///カスタムセルの登録
        currentLocationInfomationTableView.register(UINib(nibName: HomeDepartmentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeDepartmentTableViewCell.reuseIdentifier)
        
        currentLocationInfomationTableView.register(UINib(nibName: TimetableFoldingCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TimetableFoldingCell.reuseIdentifier)
        
        userCurrentNumIndex = getUserCurrent()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lottieView.loadNib()
        navigationItem.setHidesBackButton(true, animated: animated)
        self.title = "現在地"
    }
    
    @IBAction func reloadCurrentButton(_ sender: Any) {
        userCurrentNumIndex = getUserCurrent()
        self.currentLocationInfomationTableView.reloadData()
    }
    
    /// フロア情報を画面に表示する
    private func updateUI() {
        NetworkManager.shared.loadFloors { result in
            switch result {
            case .success(let floors):
                HomeViewController.floors.append(contentsOf: floors)
                self.currentLocationInfomationTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /// CLLocationManagerの設定
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
    
    /// ユーザーが何階にいるか
    /// - Returns: フロアの配列のIndex番号
    func getUserCurrent() -> Int {
        userPressure = UserDefaults.standard.double(forKey: "userPressure")
        
        let temp1 = pow(weatherPressure! / (Double(userPressure ?? 1013)), (1 / 5.257)) - 1
        let temp2 = weatherNowTemp! + 273.15
        let temp3 = temp1 * temp2
        
        let userHeight = ((temp3 / 0.0065) - 34) / 3.3
        
        userCurrentNumIndex = getCurrentFloor(userHeight: userHeight)
        
        return userCurrentNumIndex
    }
    
    private func getCurrentFloor(userHeight: Double) -> Int {
        var tmpIndex = 0
        ///少数第三位切り捨て
        let userHeightResult = floor(userHeight * 100) / 100
        
        print(userHeightResult)
        
        switch userHeightResult {
        //B2F
        case (-4.00 ... -3.00): tmpIndex = 11
            currentLocationMapImageView.image = UIImage(named: "floorB2_map")
        //B1F
        case (-2.00 ... -1.00): tmpIndex = 10
            currentLocationMapImageView.image = UIImage(named: "floorB1_map")
        //2F
        case (0.50 ... 1.50): tmpIndex = 1
            currentLocationMapImageView.image = UIImage(named: "floor2_map")
            lottieView.isHidden = false
        //3F
        case (1.51 ... 2.50): tmpIndex = 2
            currentLocationMapImageView.image = UIImage(named: "floor3_map")
        //4F
        case (2.51 ... 3.50): tmpIndex = 3
            currentLocationMapImageView.image = UIImage(named: "floor4_map")
        //5F
        case (3.51 ... 4.50): tmpIndex = 4
            currentLocationMapImageView.image = UIImage(named: "floor5_map")
        //6F
        case (4.51 ... 5.50): tmpIndex = 5
            currentLocationMapImageView.image = UIImage(named: "floor6_map")
        //7F
        case (5.51 ... 6.50): tmpIndex = 6
            currentLocationMapImageView.image = UIImage(named: "floor7_map")
        //8F
        case (6.51 ... 7.50): tmpIndex = 7
            currentLocationMapImageView.image = UIImage(named: "floor8_map")
        //9F
        case (7.51 ... 8.50): tmpIndex = 8
            currentLocationMapImageView.image = UIImage(named: "floor9_map")
        //10F
        case (8.51 ... 9.50): tmpIndex = 9
            currentLocationMapImageView.image = UIImage(named: "floor10_map")
            lottieView.isHidden = false
        //1F
        default:
            tmpIndex = 0
            currentLocationMapImageView.image = UIImage(named: "floor1_map")
            lottieView.isHidden = false
        }
        return tmpIndex
    }
    
}
extension HomeViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        self.userLatitude  = location?.coordinate.latitude
        self.userLongitude = location?.coordinate.longitude
    }
    
    /// 認証ステータスが変更されるタイミングで呼ばれる
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
