//
//  Reusable.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/07.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension NSObject: Reusable {}
