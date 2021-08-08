//
//  HomeViewHeader.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/07.
//

import UIKit

class HomeViewHeader: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupHeader(title: String) {
        headerLabel.text = title
    }
    
}
