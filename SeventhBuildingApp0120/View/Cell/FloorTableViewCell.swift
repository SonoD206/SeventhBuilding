//
//  FloorTableViewCell.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit

class FloorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var restroomImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            shadowView.backgroundColor = .systemGray4
        } else {
            shadowView.backgroundColor = .systemBackground
        }
    }
    
    func initialize(floor: Floor) {
        let restroomKind = RestroomKind(rawValue: floor.restroomKind) ?? .menAndWomen
        floorLabel.text     = "\(floor.name)F"
        restroomImageView.image = UIImage(named: restroomKind.imageName)
    }
    
}
