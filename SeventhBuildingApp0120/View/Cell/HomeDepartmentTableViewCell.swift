//
//  HomeDepartmentTableViewCell.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/17.
//

import UIKit

class HomeDepartmentTableViewCell: UITableViewCell {

    var delegate: UICollectionViewDelegate?
    var dataSource: UICollectionViewDataSource?
    
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var homeDepartmentCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeDepartmentCollectionView.register(UINib(nibName: HomeDepartmentCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: HomeDepartmentCollectionViewCell.reuseIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCollectionView
            <T: UICollectionViewDataSource & UICollectionViewDelegate >
            (dataSourceDelegate: T) {
        homeDepartmentCollectionView.delegate = dataSourceDelegate
        homeDepartmentCollectionView.dataSource = dataSourceDelegate
        homeDepartmentCollectionView.reloadData()
        }
    
}
