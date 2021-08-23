//
//  TimetableFoldingCell.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/18.
//

import UIKit
import FoldingCell

class TimetableFoldingCell: FoldingCell {
    
    ///ForegroundのItem
    @IBOutlet weak var classroomForegroundLabel: UILabel!
    @IBOutlet weak var timetableForegroundLabel: UILabel!
    
    ///ContainerのItem
    @IBOutlet weak var classroomNameLabel: UILabel!
    @IBOutlet weak var firstTimetableTitleLabel: UILabel!
    @IBOutlet weak var firstTimetableOverviewLabel: UILabel!
    @IBOutlet weak var firstTimetableStartTimeLabel: UILabel!
    
    @IBOutlet weak var secoundTimetableTitleLabel: UILabel!
    @IBOutlet weak var secoundTimetableOverviewLabel: UILabel!
    @IBOutlet weak var secoundTimetableStartTimeLabel: UILabel!
    
    @IBOutlet weak var thirdTimetableTitleLabel: UILabel!
    @IBOutlet weak var thirdTimetableOverviewLabel: UILabel!
    @IBOutlet weak var thirdTimetableStartTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
    
}
