//
//  HomeViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit
import Lottie
import CoreLocation
import CoreMotion

class HomeViewController: UIViewController {
    
    @IBOutlet weak var currentLocationInfomationTableView: UITableView!
    @IBOutlet private weak var currentLocationMapImageView: UIImageView!
    
    @IBOutlet weak var lottieView: SettingLottieView!
    
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
    
    private let altimeter = CMAltimeter()
    
    var errorAlertController: UIAlertController!
    
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
        getNowPressure()
        UserDefaults.standard.setValue(self.userPressure, forKey: "userPressure")
        userCurrentNumIndex = getUserCurrent()
        
        print(userPressure)
        print(userCurrentNumIndex)
        
        if userCurrentNumIndex == 0 || userCurrentNumIndex == 1 || userCurrentNumIndex == 9 {
            lottieView.isHidden = false
        } else {
            lottieView.isHidden = true
        }
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
        
        switch userHeightResult {
        //B2F
        case (-3.50 ... -3.00): tmpIndex = 11
            currentLocationMapImageView.image = UIImage(named: "floorB2_map")
        //B1F
        case (-2.50 ... -1.50): tmpIndex = 10
            currentLocationMapImageView.image = UIImage(named: "floorB1_map")
        //1F
        case (-1.00 ... -0.01): tmpIndex = 0
            currentLocationMapImageView.image = UIImage(named: "floor1_map")
            lottieView.isHidden = false
        //2F
        case (0.00 ... 0.99): tmpIndex = 1
            currentLocationMapImageView.image = UIImage(named: "floor2_map")
            lottieView.isHidden = false
        //3F
        case (1.00 ... 1.50): tmpIndex = 2
            currentLocationMapImageView.image = UIImage(named: "floor3_map")
        //4F
        case (1.51 ... 2.99): tmpIndex = 3
            currentLocationMapImageView.image = UIImage(named: "floor4_map")
        //5F
        case (3.00 ... 3.99): tmpIndex = 4
            currentLocationMapImageView.image = UIImage(named: "floor5_map")
        //6F
        case (4.00 ... 4.99): tmpIndex = 5
            currentLocationMapImageView.image = UIImage(named: "floor6_map")
        //7F
        case (7.00 ... 7.99): tmpIndex = 6
            currentLocationMapImageView.image = UIImage(named: "floor7_map")
        //8F
        case (8.00 ... 8.99): tmpIndex = 7
            currentLocationMapImageView.image = UIImage(named: "floor8_map")
        //9F
        case (9.00 ... 9.99): tmpIndex = 8
            currentLocationMapImageView.image = UIImage(named: "floor9_map")
        //10F
        case (10.00 ... 10.99): tmpIndex = 9
            currentLocationMapImageView.image = UIImage(named: "floor10_map")
            lottieView.isHidden = false
        //該当Floorがない時
        default:
            tmpIndex = 0
            currentLocationMapImageView.image = UIImage(named: "floor1_map")
            lottieView.isHidden = false
            errorAlert(title: "現在地の取得に失敗",
                       message: "正確に現在地を取得できませんでした。")
        }
        return tmpIndex
    }
    
    /// ユーザーがいる位置の気圧
    private func getNowPressure() {
        if (CMAltimeter.isRelativeAltitudeAvailable()) {
            altimeter.startRelativeAltitudeUpdates(to: .main, withHandler: { [self] data, error in
                if error == nil {
                    self.userPressure = Double(truncating: data!.pressure) * 10
                }
            })
        }
    }
    
    func errorAlert(title:String, message:String) {
        errorAlertController = UIAlertController(title: title,
                                                 message: message,
                                                 preferredStyle: .alert)
        errorAlertController.addAction(UIAlertAction(title: "OK",
                                                     style: .default,
                                                     handler: nil))
        present(errorAlertController, animated: true)
    }
}
