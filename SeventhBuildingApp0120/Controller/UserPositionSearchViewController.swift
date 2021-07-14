//
//  UserPositionSearchViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/14.
//

import UIKit
import Lottie

class UserPositionSearchViewController: UIViewController {

    let indicatorAnimationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLottieAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.show(LoginViewController, sender: nil)
        })
    }
    
    /// AnimationViewの初期設定
    func setLottieAnimation(){
        indicatorAnimationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: view.bounds.height / 4)
        indicatorAnimationView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        indicatorAnimationView.contentMode = .scaleAspectFit
        view.addSubview(indicatorAnimationView)
    }
    
    /// ログイン時にアニメーションを動かす
    func startLottieAnimation(){
        let indicatorAnimation = Animation.named("indicator")
        indicatorAnimationView.animation = indicatorAnimation
        indicatorAnimationView.loopMode = .loop
        indicatorAnimationView.play()
    }
    
}
