//
//  HomeTimeTableCollectionViewCell.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/17.
//

import UIKit

class HomeTimeTableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timetableOverViewLabel: UILabel!
    @IBOutlet weak var classroomNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
    
    }

}
