//
//  CurrentLocationInfomationCollectionViewExtention.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/07.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DepartmentSectionLayoutKind.allCases.count
    }
    
    
    /// 1セクション内のCellの数を設定する
    /// - Parameters:
    ///   - collectionView: currentLocationInfomationCollectionView
    ///   - section: 階にある学科一覧とタイムテーブル一覧
    /// - Returns: 1セクション内のCellの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = DepartmentSectionLayoutKind.allCases[section]
        switch section {
        case .homeDepartment:
            return 10
        case .homeDepartmentTimeTable:
            return 3
        }
    }
    
    /// １セクション内のCellのレイアウトの設定
    /// - Parameters:
    ///   - collectionView: currentLocationInfomationCollectionView
    ///   - indexPath: cellの位置
    /// - Returns: １セクション内のCellのレイアウト
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = DepartmentSectionLayoutKind.allCases[indexPath.section]
        switch section {
        
        case .homeDepartment:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeDepartmentCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeDepartmentCollectionViewCell
            return cell
            
        case .homeDepartmentTimeTable:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTimeTableCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeTimeTableCollectionViewCell

            return cell
        }
    }
    
    /// セクションのヘッダーの設定
    /// - Parameters:
    ///   - collectionView: currentLocationInfomationCollectionView
    ///   - kind: ヘッダーかフッターの種類
    ///   - indexPath: ヘッダー、フッターの位置
    /// - Returns: セクションのヘッダー
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = DepartmentSectionLayoutKind.allCases[indexPath.section]
        let headerTitle = HomeViewHeaderTitle.allCases[indexPath.section]
        
        switch section {
        
        case .homeDepartment:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeViewHeader.reuseIdentifier, for: indexPath) as! HomeViewHeader
            header.setupHeader(title: headerTitle.title)
            return header
            
        case .homeDepartmentTimeTable:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeViewHeader.reuseIdentifier, for: indexPath) as! HomeViewHeader
            header.setupHeader(title: headerTitle.title)
            return header
        }
    }
    
}
