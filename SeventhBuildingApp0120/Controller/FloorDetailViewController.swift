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
    
    var closeCellHeight: CGFloat = 98
    var openCellHeight: CGFloat = 352
    
    let foldingCellCount = 3
    var cellHeights: [CGFloat] = []
    
    var floor: Floor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellHeights = Array.init(repeating: closeCellHeight, count: foldingCellCount)
    
        mapImage.image = UIImage(named: "adalo")
        
        floorDetailTableView.delegate = self
        floorDetailTableView.dataSource = self
        
        ///カスタムセルの登録
        floorDetailTableView.register(UINib(nibName: HomeDepartmentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeDepartmentTableViewCell.reuseIdentifier)
        
        floorDetailTableView.register(UINib(nibName: TimetableFoldingCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TimetableFoldingCell.reuseIdentifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "\(floor.name)F"
    }
    
    func initialize(floor: Floor) {
        self.floor = floor
    }
}
