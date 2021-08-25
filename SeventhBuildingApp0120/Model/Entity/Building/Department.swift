//
//  Department.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/25.
//

import Foundation

struct Department: Decodable {
    let classroom: String
    let name: String?
    let imageName: String?
    let description: String?
    let color: String?
    let timetables: [Timetable]?
}
