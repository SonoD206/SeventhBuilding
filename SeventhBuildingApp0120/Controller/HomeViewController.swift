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
    ///FoldingCellの高さの配列
    var cellHeights: [CGFloat] = []
    
    /// 7号館のフロア情報を格納する配列
    static var floors: [Floor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellHeights = Array.init(repeating: closeCellHeight, count: foldingCellCount)
        
        currentLocationInfomationTableView.delegate = self
        currentLocationInfomationTableView.dataSource = self
        
        ///カスタムセルの登録
        currentLocationInfomationTableView.register(UINib(nibName: HomeDepartmentTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeDepartmentTableViewCell.reuseIdentifier)
        
        currentLocationInfomationTableView.register(UINib(nibName: TimetableFoldingCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TimetableFoldingCell.reuseIdentifier)
        
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: animated)
        self.title = "現在地"
    }
    
    /// フロア情報を画面に表示する
    private func updateUI() {
        NetworkManager.shared.loadFloors { result in
            switch result {
            case .success(let floors):
                HomeViewController.floors.append(contentsOf: floors)
                self.currentLocationInfomationTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
