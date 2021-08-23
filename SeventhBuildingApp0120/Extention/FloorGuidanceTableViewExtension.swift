//
//  FloorGuidanceTableViewExtension.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/08/09.
//

import UIKit

extension FloorGuidanceViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return floorNums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FloorTableViewCell = floorGuidanceTableView.dequeueReusableCell(withIdentifier: FloorTableViewCell.reuseIdentifier, for: indexPath) as! FloorTableViewCell

        cell.mainBackgroundView.layer.cornerRadius = 8
        cell.mainBackgroundView.layer.masksToBounds = true
        cell.floorLabel.text = floorNums[indexPath.row]
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "FloorDetail", bundle: nil)
        let homeTabStorybord = storyboard.instantiateViewController(withIdentifier: "FloorDetailStorybord") as! FloorDetailViewController
        self.show(homeTabStorybord, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height * 0.15
    }
}

