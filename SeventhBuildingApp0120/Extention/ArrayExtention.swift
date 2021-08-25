//
//  ArrayExtention.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/25.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
