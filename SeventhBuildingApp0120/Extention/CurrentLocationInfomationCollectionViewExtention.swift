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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = DepartmentSectionLayoutKind.allCases[section]
        switch section {
        case .homeDepartment:
            return 10
        case .homeDepartmentTimeTable:
            return 3
        }
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = DepartmentSectionLayoutKind.allCases[indexPath.section]
        let headerTitle = HeaderTitle.allCases[indexPath.section]
        
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
