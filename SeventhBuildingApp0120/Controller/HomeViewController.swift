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
    
    var closeCellHeight: CGFloat = 98
    var openCellHeight: CGFloat = 352
    
    let foldingCellCount = 3
    var cellHeights: [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellHeights = Array.init(repeating: closeCellHeight, count: foldingCellCount)
        
        currentLocationMapImageView.image = UIImage(named: "adalo")
        currentLocationInfomationTableView.delegate = self
        currentLocationInfomationTableView.dataSource = self
        
        ///カスタムセルの登録
        currentLocationInfomationTableView.register(UINib(nibName: HomeDepartmentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeDepartmentTableViewCell.reuseIdentifier)
        
        currentLocationInfomationTableView.register(UINib(nibName: TimetableFoldingCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TimetableFoldingCell.reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: animated)
        self.title = "現在地"
    }
    
}
