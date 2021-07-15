//
//  LottieAnimationViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/15.
//

import UIKit
import Lottie

class LottieAnimationViewController: UIViewController {
        let animationView = AnimationView()
        
        /// AnimationViewの初期設定
        func setLottieAnimation(heightPosition: Double? = nil){
            animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: view.bounds.height / 4)
            if let heightRate = heightPosition {
                animationView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height * CGFloat(heightRate))
            } else {
                animationView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
            }
            animationView.contentMode = .scaleAspectFit
            view.addSubview(animationView)
        }
        
        /// ログイン時にアニメーションを動かす
    func startLottieAnimation(name: String, mode: LottieLoopMode){
            let _animation = Animation.named(name)
            animationView.animation = _animation
            animationView.loopMode = mode
            animationView.play()
        }
}
