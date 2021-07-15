//
//  MissUserSearchViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/14.
//

import UIKit
import Lottie

class MissUserSearchViewController: LottieAnimationViewController {
    

    @IBOutlet private weak var moveToMapViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moveToMapViewButton.settingButton()
        
        setLottieAnimation(heightPosition: 0.47)
        startLottieAnimation(name: "404", mode: .loop)
    }

}
