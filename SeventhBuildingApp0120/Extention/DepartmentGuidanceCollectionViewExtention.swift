//
//  DepartmentGuidanceCollectionViewExtention.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/11.
//

import UIKit


extension DepartmentGuidanceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DepartmentGuidanceSectionLayoutKind.allCases.count
    }
    
    /// １セクション内のCellの数を設定する
    /// - Parameters:
    ///   - collectionView: departmentGuidanceCollectionView
    ///   - section: 学科ごとの教室
    /// - Returns: １セクション内のCellの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = DepartmentGuidanceSectionLayoutKind.allCases[section]
        
        switch section {
        case .informationProcessingDepartmentRoom:
            return 2
        case .informationBusinessLicenseDepartmentRoom:
            return 1
        case .informationSystemDevelopmentDepartmentRoom:
            return 1
        case .advancedInformationProcessingDepartmentRoom:
            return 1
        case .gameProductionResearchDepartmentRoom:
            return 1
        case .gamePlanningDepartmentRoom:
            return 1
        case .gameProductionDepartmentRoom:
            return 1
        case .animationDepartmentRoom:
            return 1
        case .animationResearchDepartmentRoom:
            return 1
        case .graphicDesignDepartmentRoom:
            return 1
        case .webDesignDepartmentRoom:
            return 1
        case .mobileApplicationDepartmentRoom:
            return 2
        case .computerGraphicResearchDepartmentRoom:
            return 3
        case .computerGraphicDepartmentRoom:
            return 3
        case .cgVideosProductionDepartmentRoom:
            return 3
        case .aiSystemDepartmentRoom:
            return 1
        case .networkSecurityDepartmentRoom:
            return 1
        case .advancedElectricalEngineeringDepartmentRoom:
            return 1
        case .electricalEngineeringDepartmentRoom:
            return 1
        case .electricalWorkTechnologyDepartmentRoom:
            return 1
        case .electronicAppliedEngineeringDepartmentRoom:
            return 3
        }
    }
    
    /// １セクション内のCellのレイアウトの設定
    /// - Parameters:
    ///   - collectionView: currentLocationInfomationCollectionView
    ///   - indexPath: cellの位置
    /// - Returns: １セクション内のCellのレイアウト
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = DepartmentGuidanceSectionLayoutKind.allCases[indexPath.section]
        switch section {
        case
            ///情報系学科
            .informationProcessingDepartmentRoom,
            .informationBusinessLicenseDepartmentRoom,
            .informationSystemDevelopmentDepartmentRoom,
            .advancedInformationProcessingDepartmentRoom,
            ///ゲーム系学科
            .gameProductionResearchDepartmentRoom,
            .gamePlanningDepartmentRoom,
            .gameProductionDepartmentRoom,
            ///アニメーション学科
            .animationDepartmentRoom,
            .animationResearchDepartmentRoom,
            ///デザイン系学科
            .graphicDesignDepartmentRoom,
            .webDesignDepartmentRoom,
            ///ケータイ・アプリケーション科
            .mobileApplicationDepartmentRoom,
            ///CG学科
            .computerGraphicResearchDepartmentRoom,
            .computerGraphicDepartmentRoom,
            .cgVideosProductionDepartmentRoom,
            ///AI学科
            .aiSystemDepartmentRoom,
            ///ネットワークセキュリティ
            .networkSecurityDepartmentRoom,
            ///電子系学科
            .advancedElectricalEngineeringDepartmentRoom,
            .electricalEngineeringDepartmentRoom,
            .electricalWorkTechnologyDepartmentRoom,
            .electronicAppliedEngineeringDepartmentRoom :
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DepartmentCollectionViewCell.reuseIdentifier, for: indexPath) as! DepartmentCollectionViewCell
            
            cell.contentView.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 8
    
            cell.layer.masksToBounds = false
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 3
            cell.layer.shadowOpacity = 0.3
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
            cell.layer.shouldRasterize = true
            cell.layer.rasterizationScale = UIScreen.main.scale
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = DepartmentGuidanceSectionLayoutKind.allCases[indexPath.section]
        let headerTitle = DepartmentGuidanceHeaderTitle.allCases[indexPath.section]
        
        switch section {
        case
            ///情報系学科
            .informationProcessingDepartmentRoom,
            .informationBusinessLicenseDepartmentRoom,
            .informationSystemDevelopmentDepartmentRoom,
            .advancedInformationProcessingDepartmentRoom,
            ///ゲーム系学科
            .gameProductionResearchDepartmentRoom,
            .gamePlanningDepartmentRoom,
            .gameProductionDepartmentRoom,
            ///アニメーション学科
            .animationDepartmentRoom,
            .animationResearchDepartmentRoom,
            ///デザイン系学科
            .graphicDesignDepartmentRoom,
            .webDesignDepartmentRoom,
            ///ケータイ・アプリケーション科
            .mobileApplicationDepartmentRoom,
            ///CG学科
            .computerGraphicResearchDepartmentRoom,
            .computerGraphicDepartmentRoom,
            .cgVideosProductionDepartmentRoom,
            ///AI学科
            .aiSystemDepartmentRoom,
            ///ネットワークセキュリティ
            .networkSecurityDepartmentRoom,
            ///電子系学科
            .advancedElectricalEngineeringDepartmentRoom,
            .electricalEngineeringDepartmentRoom,
            .electricalWorkTechnologyDepartmentRoom,
            .electronicAppliedEngineeringDepartmentRoom :
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeViewHeader.reuseIdentifier, for: indexPath) as! HomeViewHeader
            header.setupHeader(title: headerTitle.title)
            
            return header
        }
    }
}

