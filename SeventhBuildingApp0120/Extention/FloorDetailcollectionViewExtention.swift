//
//  FloorDetailCollectionViewExtention.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/12.
//

import UIKit

extension FloorDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
        /// 1セクション内のCellの数を設定する
        /// - Parameters:
        ///   - collectionView: homeDepartmentCollectionView
        ///   - section: 階にある学科一覧とタイムテーブル一覧
        /// - Returns: 1セクション内のCellの数
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return floor.departments.count
        }
    
        /// １セクション内のCellのレイアウトの設定
        /// - Parameters:
        ///   - collectionView: homeDepartmentCollectionView
        ///   - indexPath: cellの位置
        /// - Returns: １セクション内のCellのレイアウト
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeDepartmentCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeDepartmentCollectionViewCell
            
            cell.initialize(floor: floor)
            
            return cell
        }
    
    
    ///　Cellの高さ
    /// - Parameters:
    ///   - collectionView: homeDepartmentCollectionView
    ///   - collectionViewLayout: UICollectionViewDelegateFlowLayout
    ///   - indexPath: cellの位置
    /// - Returns: cellの高さ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = collectionView.frame.height
        let width: CGFloat = collectionView.frame.width * 0.9
        return CGSize(width: width, height: height  )
    }
    
    /// Cellの縦の間隔
    /// - Parameters:
    ///   - collectionView: homeDepartmentCollectionView
    ///   - collectionViewLayout: UICollectionViewDelegateFlowLayout
    ///   - section: cellの位置
    /// - Returns: Cellの縦の間隔
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    /// Cellの横の間隔
    /// - Parameters:
    ///   - collectionView: homeDepartmentCollectionView
    ///   - collectionViewLayout: UICollectionViewDelegateFlowLayout
    ///   - section: cellの位置
    /// - Returns: Cellの横の間隔
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }    
}
