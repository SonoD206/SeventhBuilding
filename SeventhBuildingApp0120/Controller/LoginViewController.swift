//
//  LoginViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var passwordInputTextField: UITextField!
    @IBOutlet private weak var missLoginMessageLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    
    let loginSuccessAnimationView = AnimationView()
    let password = "open2021"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordInputTextField.delegate = self
        
        setLottieAnimation()
        
        //passwordInputTextFieldに下線を追加
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: passwordInputTextField.frame.size.height - width, width:  view.frame.size.width * 0.7, height: 1)
        border.borderWidth = width
        passwordInputTextField.layer.addSublayer(border)
        
        loginButton.settingButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        if self.passwordInputTextField.text == password {
            missLoginMessageLabel.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.startLottieAnimation()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    let HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! UITabBarController
                    self.show(HomeViewController, sender: nil)
                })
            })
        } else {
            missLoginMessageLabel.isHidden = false
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            } else {
                let suggestionHeight = self.view.frame.origin.y + keyboardSize.height
                self.view.frame.origin.y -= suggestionHeight
            }
        }
    }
    
    @objc func keyboardWillHide(){
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    /// AnimationViewの初期設定
    func setLottieAnimation(){
        loginSuccessAnimationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: view.bounds.height / 4)
        loginSuccessAnimationView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        loginSuccessAnimationView.contentMode = .scaleAspectFit
        view.addSubview(loginSuccessAnimationView)
    }
    
    /// ログイン時にアニメーションを動かす
    func startLottieAnimation(){
        let successAnimaiton = Animation.named("success")
        loginSuccessAnimationView.animation = successAnimaiton
        loginSuccessAnimationView.loopMode = .playOnce
        loginSuccessAnimationView.play()
    }
    
}
