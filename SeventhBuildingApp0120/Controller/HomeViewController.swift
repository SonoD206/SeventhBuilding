//
//  HomeViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var currentLocationMapImageView: UIImageView!
    @IBOutlet private weak var currentLocationInfomationCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentLocationMapImageView.image = UIImage(named: "adalo")
        createHomeVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: animated)
        self.title = "現在地"
    }
    
    ///currentLocationInfomationCollectionViewを初期化
    private func createHomeVC() {
        currentLocationInfomationCollectionView.delegate = self
        currentLocationInfomationCollectionView.dataSource = self
        
        currentLocationInfomationCollectionView.register(UINib(nibName: HomeDepartmentCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: HomeDepartmentCollectionViewCell.reuseIdentifier)
        
        currentLocationInfomationCollectionView.register(UINib(nibName: HomeTimeTableCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: HomeTimeTableCollectionViewCell.reuseIdentifier)
        
        currentLocationInfomationCollectionView.register(UINib(nibName: HomeViewHeader.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeViewHeader.reuseIdentifier)
        
        currentLocationInfomationCollectionView.collectionViewLayout = createLayout()
    }
    
    /// currentLocationInfomationCollectionView全体のレイアウトを作る
    /// - Returns: currentLocationInfomationCollectionView全体のレイアウト
    private func createLayout() -> UICollectionViewLayout {
        
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
