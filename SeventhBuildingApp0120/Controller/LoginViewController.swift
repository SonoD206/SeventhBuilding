//
//  LoginViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    let loginSuccessAnimationView = AnimationView()
    @IBOutlet weak var passwordInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordInputTextField.delegate = self
        
        setLottieAnimation()
        
        //テキストフィールドに下線を追加
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: passwordInputTextField.frame.size.height - width, width:  passwordInputTextField.frame.size.width, height: 1)
        border.borderWidth = width
        passwordInputTextField.layer.addSublayer(border)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        print("hoge")
        startLottieAnimation()
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

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
