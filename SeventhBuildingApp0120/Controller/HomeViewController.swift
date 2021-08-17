//
//  HomeViewController.swift
//  SeventhBuildingApp0120
//
//  Created by cmStudent on 2021/07/13.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var currentLocationInfomationTableView: UITableView!
    @IBOutlet private weak var currentLocationMapImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentLocationMapImageView.image = UIImage(named: "adalo")
        currentLocationInfomationTableView.delegate = self
        currentLocationInfomationTableView.dataSource = self
        
        ///カスタムセルの登録
        currentLocationInfomationTableView.register(UINib(nibName: HomeDepartmentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeDepartmentTableViewCell.reuseIdentifier)
        
        currentLocationInfomationTableView.register(UINib(nibName: HomeTimetableTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeTimetableTableViewCell.reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: animated)
        self.title = "現在地"
    }
    
}
