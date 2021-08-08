//
//  HeaderTitle.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/07.
//

import Foundation

enum HeaderTitle: CaseIterable {
    case deaprtmentSectionHeader
    case timetableSectionHeader
    
    /// ヘッダーのタイトル
    var title: String {
        switch self {
        case .deaprtmentSectionHeader:
            return "この階の学科"
        case .timetableSectionHeader:
            return "タイムテーブル"
        }
    }
}
