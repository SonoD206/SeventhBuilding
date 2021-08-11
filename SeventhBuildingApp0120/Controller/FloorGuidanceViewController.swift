//
//  FloorGuidanceViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/08.
//

import UIKit
import XLPagerTabStrip

class FloorGuidanceViewController: UIViewController {
    
    ///ボタンのタイトル
    var itemInfo: IndicatorInfo = "階"
    
    @IBOutlet weak var floorGuidanceTableView: UITableView!
    
    ///Debag用
    let floorNums = ["B2F","B1F","1F","2F","3F","4F","5F","6F","7F","8F","9F","10F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floorGuidanceTableView.delegate = self
        floorGuidanceTableView.dataSource = self
        ///セルの選択不可
        floorGuidanceTableView.allowsSelection = false
        
        ///カスタムセルの登録
        floorGuidanceTableView.register(UINib(nibName: FloorTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: FloorTableViewCell.reuseIdentifier)
        }
    }

extension FloorGuidanceViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}

class ShadowView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }
    
    private func setupShadow() {
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
