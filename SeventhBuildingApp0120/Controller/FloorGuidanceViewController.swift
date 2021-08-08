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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension FloorGuidanceViewController: IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
