//
//  HomeDepartmentCollectionViewCell.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/17.
//

import UIKit

class HomeDepartmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var departmentNameLabel: UILabel!
    @IBOutlet weak var restroomKindImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowColor = UIColor.black.cgColor
    }
}
