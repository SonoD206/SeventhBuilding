//
//  DepartmentGuidanceViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/08.
//

import UIKit
import XLPagerTabStrip

class DepartmentGuidanceViewController: UIViewController {
    
    var floors: [Floor] = []
    
    @IBOutlet weak var departmentGuidanceCollectionView: UICollectionView!
    ///ボタンのタイトル
    var itemInfo: IndicatorInfo = "学科"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        departmentGuidanceCollectionView.delegate = self
        departmentGuidanceCollectionView.dataSource = self
        
        ///CollectionViewのCellの登録
        departmentGuidanceCollectionView.register(UINib(nibName: DepartmentCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: DepartmentCollectionViewCell.reuseIdentifier)
        
        ///SectionHeaderの登録
        departmentGuidanceCollectionView.register(UINib(nibName: HomeViewHeader.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeViewHeader.reuseIdentifier)
        
        departmentGuidanceCollectionView.collectionViewLayout = createLayout()
    }
    
//    MARK: - CreateCollectionViewLayout
    /// departmentGuidanceCollectionView全体のLayoutを作る
    /// - Returns: departmentGuidanceCollectionView全体のLayout
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let departmentGuidanceSectionLayoutKind = DepartmentGuidanceSectionLayoutKind.allCases[sectionIndex]
            
            switch departmentGuidanceSectionLayoutKind {
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
                return self.createDepartmentRoomGuidance()
            }
        }
        return layout
    }
    
//    MARK: - CreateSectionLayout
    private func createDepartmentRoomGuidance() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                               heightDimension:.fractionalHeight(0.13))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 16
        section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        return section
    }
    
}

extension DepartmentGuidanceViewController: IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
