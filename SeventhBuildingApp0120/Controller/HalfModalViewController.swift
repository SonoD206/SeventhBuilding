//
//  HalfModalViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/30.
//

import UIKit

class HalfModalViewController: UIViewController {
    
    @IBOutlet weak var walkingTimeLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var walkingImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walkingImageView.layer.borderColor = UIColor.black.cgColor
        walkingImageView.layer.borderWidth = 1
        walkingImageView.layer.cornerRadius = 5
        
    }
    
    static func fromStoryboard(_ storyboard: UIStoryboard = UIStoryboard(name: "HalfModal", bundle: nil)) -> HalfModalViewController {
        let controller = storyboard.instantiateViewController(withIdentifier: "HalfModalVC") as! HalfModalViewController
        return controller
    }
}

