//
//  HomeCatalogViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/16.
//

import UIKit
import XLPagerTabStrip

class HomeCatalogViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        setUI()
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            // 強制的に再選択し、changeCurrentIndexProgressiveを動作させる（ 0番目 → 1番目 → 0番目 ）
            moveToViewController(at: 1, animated: false)
            moveToViewController(at: 0, animated: false)
        }
    
    func setUI() {
        // ButtonBar全体の背景色
        settings.style.buttonBarBackgroundColor = UIColor.white
        // ButtonBarItemの背景色
        settings.style.buttonBarItemBackgroundColor = UIColor.white
        // ButtonBarItemの文字色
        settings.style.buttonBarItemTitleColor = UIColor.lightGray
        // ButtonBarItemのフォントサイズ
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 18.5)
        // 選択中のButtonBarインジケーターの色
        settings.style.selectedBarBackgroundColor = UIColor.green
        // 選択中のButtonBarインジケーターの太さ
        settings.style.selectedBarHeight = 5.0
        // ButtonBarの左端の余白
        settings.style.buttonBarLeftContentInset = 0
        // ButtonBarの右端の余白
        settings.style.buttonBarRightContentInset = 0
        // Button内の余白
        settings.style.buttonBarItemLeftRightMargin = 32
        // スワイプやButtonBarItemタップ等でページを切り替えた時の動作
        changeCurrentIndexProgressive = { oldCell, newCell, progressPercentage, changeCurrentIndex, animated in
            // 変更されたか、選択前後のCellをアンラップ
            guard changeCurrentIndex, let oldCell = oldCell, let newCell = newCell else { return }
            // 選択前のセルの状態を指定
            oldCell.label.textColor = UIColor.lightGray
            // 選択後のセルの状態を指定する
            newCell.label.textColor = UIColor.black
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        ///管理する子VCを返す
        let floorGuidanceView = UIStoryboard(name: "FloorGuidance", bundle: nil).instantiateViewController(identifier: "FloorGuidance") as! FloorGuidanceViewController
        
        let departmentGuidanceView = UIStoryboard(name: "DepartmentGuidance", bundle: nil).instantiateViewController(identifier: "DepartmentGuidance") as! DepartmentGuidanceViewController
        
        let childViewControllers: [UIViewController] = [floorGuidanceView,departmentGuidanceView]
        return childViewControllers
    }
}
