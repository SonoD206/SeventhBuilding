//
//  LoginViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit
import Lottie
import CoreMotion

class LoginViewController: LottieAnimationViewController {
    
    @IBOutlet private weak var passwordInputTextField: UITextField!
    @IBOutlet private weak var missLoginMessageLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    
    let password = "open2021"
    private let weatherURL = "https://api.openweathermap.org/data/2.5/onecall"
    
    private let altimeter = CMAltimeter()
    
    var pressure: Int?
    var nowTemp: Double?
    var userPressure: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard var urlCompornents = URLComponents(string: weatherURL) else {
            print("error")
            return
        }
        
        urlCompornents.queryItems = [
//            URLQueryItem(name: "lat", value: "35.70729317048879"),
//            URLQueryItem(name: "lon", value: "139.65236801616297"),
            URLQueryItem(name: "lat", value: "35.69885661199422"),
            URLQueryItem(name: "lon", value: "139.69652530835802"),
            URLQueryItem(name: "lang", value: "ja"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "e136a380ba3c2e850f1a8fe11f5588ac")
        ]
        
        setLottieAnimation()
        settingTextField()
        loginButton.settingButton()
        loadOpenWeather(urlCompornents: urlCompornents)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        getNowPressure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: animated)
    }
    
    @IBAction private func tappedLoginButton(_ sender: UIButton) {
        if isHavingLoginItem() {
            missLoginMessageLabel.isHidden = true
            
            UserDefaults.standard.setValue(self.pressure, forKey: "pressure")
            UserDefaults.standard.setValue(self.nowTemp, forKey: "temp")
            UserDefaults.standard.setValue(self.userPressure, forKey: "userPressure")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.startLottieAnimation(name: "success", mode: .playOnce)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: {
                    
                    let storyboard = UIStoryboard(name: "HomeTab", bundle: nil)
                    let homeTabStorybord = storyboard.instantiateViewController(withIdentifier: "HomeTabStorybord") as! UITabBarController
                    self.show(homeTabStorybord, sender: nil)
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
    
    /// TextFieldの設定
    func settingTextField(){
        self.passwordInputTextField.delegate = self
        //passwordInputTextFieldに下線を追加
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: passwordInputTextField.frame.size.height - width, width:  view.frame.size.width * 0.7, height: 1)
        border.borderWidth = width
        passwordInputTextField.layer.addSublayer(border)
    }
    
    /// OpenWeatherAPIを叩く
    /// - Parameter urlCompornents: urlのItem
    func loadOpenWeather(urlCompornents: URLComponents){
            URLSession.shared.dataTask(with: urlCompornents.url!) {
                data, response, error in
                
                guard let data = data else { return }
                
                do {
                    let apiData = try JSONDecoder().decode(Weather.self, from: data)
                    DispatchQueue.main.async {
                        self.pressure = apiData.current.pressure
                        self.nowTemp = apiData.current.temp
                    }
                } catch {
                    print(error)
                }
            }.resume()
    }
    
    /// Loginの際に必要なアイテムがあるかどうか
    /// - Returns: True or False
    func isHavingLoginItem() -> Bool{
        if (self.nowTemp != nil && self.nowTemp != nil) && self.passwordInputTextField.text == password {
            return true
        } else {
            return false
        }
    
    }
    /// ユーザーがいる位置の気圧
    private func getNowPressure() {
        if (CMAltimeter.isRelativeAltitudeAvailable()) {
            altimeter.startRelativeAltitudeUpdates(to: .main, withHandler: { [self] data, error in
                if error == nil {
                    self.userPressure = Double(truncating: data!.pressure) * 10
                }
            })
        }
    }
}
