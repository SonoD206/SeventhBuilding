//
//  FloorDetailViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit

class FloorDetailViewController: UIViewController {
    
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var floorDetailTableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mapImage.image = UIImage(named: "adalo")
        
        floorDetailTableView.delegate = self
        floorDetailTableView.dataSource = self
        
        ///カスタムセルの登録
        floorDetailTableView.register(UINib(nibName: HomeDepartmentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeDepartmentTableViewCell.reuseIdentifier)
        
        floorDetailTableView.register(UINib(nibName: HomeTimetableTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeTimetableTableViewCell.reuseIdentifier)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "B2F"
    }
}
