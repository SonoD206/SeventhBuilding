//
//  ButtonExtension.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit

extension UIButton {
    /// Buttonの角丸と影の各種設定をする関数
    func settingButton() {
        // 角丸
        layer.cornerRadius = 10
        // 影の濃さ
        layer.shadowOpacity = 0.3
        // 影のぼかしの大きさ
        layer.shadowRadius = 1
        // 影の色
        layer.shadowColor = UIColor.black.cgColor
        // 影の方向（width=右方向、height=下方向）
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
