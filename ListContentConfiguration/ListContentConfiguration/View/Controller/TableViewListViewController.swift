//
//  TableViewListViewController.swift
//  ListContentConfiguration
//
//  Created by user on 07/12/23.
//

import UIKit

class TableViewListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // https://developer.apple.com/documentation/uikit/uilistcontentconfiguration
        listTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension TableViewListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError("You forgot to register your table view cell")
        }
        
        var listContentConfiguration = cell.defaultContentConfiguration()
        listContentConfiguration.image = UIImage(systemName: "star")
        listContentConfiguration.text = "Favorites \(indexPath.row + 1)"
        listContentConfiguration.secondaryText = "Desc \(indexPath.row + 1)"
        listContentConfiguration.imageProperties.tintColor = .purple
        
        cell.contentConfiguration = listContentConfiguration
        return cell
    }
}
