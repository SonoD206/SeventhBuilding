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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        startLottieAnimation(name: "walk", mode: .loop)
    }
    
    @IBAction private func tappedMoveToMapViewButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let mapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController")
        self.show(mapViewController, sender: nil)
    }
    
}
