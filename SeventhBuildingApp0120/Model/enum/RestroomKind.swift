//
//  RestroomKind.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/25.
//

import Foundation

public enum RestroomKind: Int {
    case men         = 1
    case women       = 2
    case menAndWomen = 3
    
    /// トイレの画像名
    var imageName: String {
        switch self {
        case .men:
            return "blueMan"
        case .women:
            return "redWoman"
        case .menAndWomen:
            return "toilet"
        }
    }
    
}
