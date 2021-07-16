//
//  UserPositionSearchViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/14.
//

import UIKit
import Lottie

class UserPositionSearchViewController: LottieAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLottieAnimation()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        startLottieAnimation(name: "indicator", mode:.loop)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.show(loginViewController, sender: nil)
            
//            let storyboard = UIStoryboard(name: "MissUserSearch", bundle: nil)
//            let missUserSearchViewController = storyboard.instantiateViewController(withIdentifier: "MissUserSearchViewController")
//            self.show(missUserSearchViewController, sender: nil)
        })
    }
}
