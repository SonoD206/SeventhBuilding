//
//  FloorGuidanceTableViewExtension.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/09.
//

import UIKit

extension FloorGuidanceViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FloorsLayoutKind.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let floor = HomeViewController.floors[indexPath.row]
        let cell: FloorTableViewCell = floorGuidanceTableView.dequeueReusableCell(withIdentifier: FloorTableViewCell.reuseIdentifier, for: indexPath) as! FloorTableViewCell

        cell.mainBackgroundView.layer.cornerRadius = 8
        cell.mainBackgroundView.layer.masksToBounds = true
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.initialize(floor: floor)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "FloorDetail", bundle: nil)
        let floor = HomeViewController.floors[indexPath.row]
        let floorDetailVC = storyboard.instantiateViewController(withIdentifier: "FloorDetailStorybord") as! FloorDetailViewController
        floorDetailVC.initialize(floor: floor)
        self.show(floorDetailVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height * 0.15
    }
    
}

