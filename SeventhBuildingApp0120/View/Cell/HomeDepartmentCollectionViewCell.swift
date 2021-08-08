//
//  HomeDepartmentCollectionViewCell.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/17.
//

import UIKit

class HomeDepartmentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var departmentNameLabel: UILabel!
    @IBOutlet weak var departmentInfomationLabel: UILabel!
    @IBOutlet weak var restroomKindImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
    
    }
}
