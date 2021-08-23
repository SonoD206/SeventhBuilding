//
//  HomeTimetableTableViewCell.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/17.
//

import UIKit

class HomeTimetableTableViewCell: UITableViewCell {
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var classroomLabel: UILabel!
    @IBOutlet weak var timetableNameLabel: UILabel!
    @IBOutlet weak var homeTimetableStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            homeTimetableStackView.backgroundColor = .systemGray4
        } else {
            homeTimetableStackView.backgroundColor = .systemBackground
        }
    }
}
