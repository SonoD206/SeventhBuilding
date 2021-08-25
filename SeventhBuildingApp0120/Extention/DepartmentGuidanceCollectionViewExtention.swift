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
            return 1
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
            return 1
        case .computerGraphicDepartmentRoom:
            return 1
        case .cgVideosProductionDepartmentRoom:
            return 1
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
            return 1
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
        ///情報系学科
        case .informationProcessingDepartmentRoom:
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
            
            cell.classroomLabel.text = "732"
            
            return cell
            
        case .informationBusinessLicenseDepartmentRoom:
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

            cell.classroomLabel.text = "733"
            return cell

        case .informationSystemDevelopmentDepartmentRoom:
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
            
            cell.classroomLabel.text = "762"
            
            return cell
            
        case .advancedInformationProcessingDepartmentRoom:
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
            
            cell.classroomLabel.text = "763"
            
            return cell
            
        ///ゲーム系学科
        case .gameProductionResearchDepartmentRoom:
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
            
            cell.classroomLabel.text = "741"
            
            return cell
            
        case .gamePlanningDepartmentRoom:
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
            
            cell.classroomLabel.text = "731"
            
            return cell
            
            
        case .gameProductionDepartmentRoom:
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
            
            cell.classroomLabel.text = "742"
            
            return cell
            
        ///アニメーション学科
        case .animationDepartmentRoom:
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
            
            cell.classroomLabel.text = "751"
            
            return cell
            
        case .animationResearchDepartmentRoom:
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
            
            cell.classroomLabel.text = "752"
            
            return cell
            
        ///デザイン系学科
        case .graphicDesignDepartmentRoom:
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
            
            cell.classroomLabel.text = "761"
            
            return cell
            
        case .webDesignDepartmentRoom:
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
            
            cell.classroomLabel.text = "771"
            
            return cell
        ///ケータイ・アプリケーション科
        case .mobileApplicationDepartmentRoom:
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
            
            if indexPath.row == 0 {
                cell.classroomLabel.text = "781"
            } else {
                cell.classroomLabel.text = "782"
            }
            
            return cell
        ///CG学科
        case .computerGraphicResearchDepartmentRoom:
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
            
            cell.classroomLabel.text = "7B14"
            
            return cell
            
        case .computerGraphicDepartmentRoom:
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
            
            cell.classroomLabel.text = "7B11"
            //7B14
            return cell
            
        case .cgVideosProductionDepartmentRoom:
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
            
            cell.classroomLabel.text = "7B12"
            
            return cell
        ///AI学科
        case .aiSystemDepartmentRoom:
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
            
            cell.classroomLabel.text = "7B22"
            
            return cell
            
        ///ネットワークセキュリティ
        case .networkSecurityDepartmentRoom:
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
            
            cell.classroomLabel.text = "7B21"
            
            return cell
            
        ///電子系学科
        case .advancedElectricalEngineeringDepartmentRoom:
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
            
            cell.classroomLabel.text = "772"
            
            return cell
            
        case .electricalEngineeringDepartmentRoom:
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
            
            cell.classroomLabel.text = "773"
            
            return cell
            
        case .electricalWorkTechnologyDepartmentRoom:
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
            
            cell.classroomLabel.text = "783"
            
            return cell
            
        case .electronicAppliedEngineeringDepartmentRoom :
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
            
            cell.classroomLabel.text = "792"
            
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DepartmentCollectionViewCell
        
        switch cell.classroomLabel.text! {
        case "731","732","733" :
            moveFloorVC(floorPosition: 2)
        case "741","742","743" :
            moveFloorVC(floorPosition: 3)
        case "751","752","753" :
            moveFloorVC(floorPosition: 4)
        case "761","762","763" :
            moveFloorVC(floorPosition: 5)
        case "771","772","773" :
            moveFloorVC(floorPosition: 6)
        case "781","782","783" :
            moveFloorVC(floorPosition: 7)
        case "791","792" :
            moveFloorVC(floorPosition: 8)
        case "7B11","7B12","7B14":
            moveFloorVC(floorPosition: 10)
        case "7B21","7B22":
            moveFloorVC(floorPosition: 11)
        default:
            print("えらー")
        }
    }
    
    func moveFloorVC(floorPosition: Int){
        let storyboard = UIStoryboard(name: "FloorDetail", bundle: nil)
        let floor = HomeViewController.floors[floorPosition]
        let floorDetailVC = storyboard.instantiateViewController(withIdentifier: "FloorDetailStorybord") as! FloorDetailViewController
        floorDetailVC.initialize(floor: floor)
        self.show(floorDetailVC, sender: nil)
    }
}

