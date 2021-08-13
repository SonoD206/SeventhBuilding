//
//  FloorDetailViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit

class FloorDetailViewController: UIViewController {
    
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var floorDetailCollectionView: UICollectionView!
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapImage.image = UIImage(named: "adalo")
        setUpCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "B2F"
    }
    
    //    MARK: -　HomeViewと同じレイアウト
        ///floorDetailCollectionViewの初期化
        private func setUpCollectionView() {
            floorDetailCollectionView.delegate = self
            floorDetailCollectionView.dataSource = self
    
            floorDetailCollectionView.register(UINib(nibName: HomeDepartmentCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: HomeDepartmentCollectionViewCell.reuseIdentifier)
    
            floorDetailCollectionView.register(UINib(nibName: HomeTimeTableCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: HomeTimeTableCollectionViewCell.reuseIdentifier)
    
            floorDetailCollectionView.register(UINib(nibName: HomeViewHeader.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeViewHeader.reuseIdentifier)
    
            floorDetailCollectionView.collectionViewLayout = createLayout()
        }
    
        /// floorDetailCollectionView全体のレイアウト構成
        /// - Returns: 各セクションのレイアウト
        private func createLayout() -> UICollectionViewLayout{
            let layout = UICollectionViewCompositionalLayout {
                (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
    
                let departmentSectionLayoutKind = DepartmentSectionLayoutKind.allCases[sectionIndex]
                switch departmentSectionLayoutKind {
                case .homeDepartment:
                    return self.createHomeDepartmentLayout()
                case .homeDepartmentTimeTable:
                    return self.createHomeDepartmentTimeTableLayout()
                }
            }
            return layout
        }
    
        /// HomeDepartmentのレイアウト構成をする
        private func createHomeDepartmentLayout() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                   heightDimension: .fractionalHeight(0.2))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
            let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .estimated(1))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                            elementKind: UICollectionView.elementKindSectionHeader,
                                                                            alignment: .top)
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [sectionHeader]
            section.orthogonalScrollingBehavior = .groupPaging
            section.interGroupSpacing = 10
            section.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
    
            return section
        }
    
        /// HomeDepartmentTimeTableのレイアウト構成をする
        private func createHomeDepartmentTimeTableLayout() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .estimated(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .estimated(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
    
            let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                           heightDimension: .estimated(1))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                            elementKind: UICollectionView.elementKindSectionHeader,
                                                                            alignment: .top)
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [sectionHeader]
            section.interGroupSpacing = 16
            section.contentInsets = .init(top: 10, leading: 10, bottom: 20, trailing: 10)
    
            return section
        }
}
