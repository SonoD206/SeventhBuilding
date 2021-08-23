//
//  FloorDetailTableViewExtention.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/17.
//

import UIKit
import FoldingCell

extension FloorDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    /// 各セクションの数を取る
    /// - Parameter tableView: floorDetailTableView
    /// - Returns:各セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return DepartmentSectionLayoutKind.allCases.count
    }
    
    /// 各セクションのヘッダーのタイトルの指定
    /// - Parameters:
    ///   - tableView: floorDetailTableView
    ///   - section: DepartmentSectionLayoutKind
    /// - Returns: 各セクションのヘッダーのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = DepartmentSectionLayoutKind.allCases[section]
        switch section {
        case .homeDepartment:
            return "この階の学科"
        case .homeDepartmentTimeTable:
            return "タイムテーブル"
        }
    }
    
    /// 各セクションのCellの数を指定
    /// - Parameters:
    ///   - tableView: floorDetailTableView
    ///   - section: DepartmentSectionLayoutKind
    /// - Returns: 各セクションのCellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = DepartmentSectionLayoutKind.allCases[section]
        switch section {
        case .homeDepartment:
            return 1
        case .homeDepartmentTimeTable:
            return foldingCellCount
        }
    }
    
    /// Cellの登録
    /// - Parameters:
    ///   - tableView: floorDetailTableView
    ///   - indexPath: cellの位置
    /// - Returns: 登録したCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = DepartmentSectionLayoutKind.allCases[indexPath.section]
        switch section {
        
        case .homeDepartment:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeDepartmentTableViewCell.reuseIdentifier, for: indexPath) as! HomeDepartmentTableViewCell
            cell.setupCollectionView(dataSourceDelegate: self)
            cell.mainBackgroundView.layer.cornerRadius = 8
            cell.mainBackgroundView.layer.masksToBounds = true
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        case .homeDepartmentTimeTable:
            let cell = tableView.dequeueReusableCell(withIdentifier: TimetableFoldingCell.reuseIdentifier, for: indexPath) as! TimetableFoldingCell
        
            return cell
        }
    }
    
    /// 各セクションの中にあるCellの大きさ
    /// - Parameters:
    ///   - tableView: floorDetailTableView
    ///   - indexPath: cellの位置
    /// - Returns: 各セクションの中にあるCellの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = DepartmentSectionLayoutKind.allCases[indexPath.section]
        switch section {
        
        case .homeDepartment:
            return tableView.frame.height * 0.2
            
        case .homeDepartmentTimeTable:
            return cellHeights[indexPath.row]
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard case let cell as TimetableFoldingCell = tableView.cellForRow(at: indexPath) else {
            return
        }
        var duration = 0.0
        
        if cellHeights[indexPath.row] == closeCellHeight { // open cell
            cellHeights[indexPath.row] = openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.5
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
}
