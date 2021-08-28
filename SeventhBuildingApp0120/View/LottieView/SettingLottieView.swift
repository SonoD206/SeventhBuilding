//
//  SettingLottieView.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/28.
//

import UIKit
import Lottie

class SettingLottieView: UIView {
    
    @IBOutlet weak var settingLottieView: LottieView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
            setLottie()
        }
    }
    
    /// 1F,2F,10FのLottieの設置
    private func setLottie() {
        let settingView = AnimationView()
        let animation = Animation.named("setting")
        
        settingView.frame = settingLottieView.bounds
        settingView.animation = animation
        settingView.contentMode = .scaleAspectFit
        settingView.loopMode = .loop
        settingView.play()
        
        settingLottieView.addSubview(settingView)
    }
    
    
}
