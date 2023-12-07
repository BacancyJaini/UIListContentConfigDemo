//
//  ViewController.swift
//  ListContentConfiguration
//
//  Created by user on 07/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // https://developer.apple.com/documentation/uikit/uilistcontentconfiguration
        listTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError("You forgot to register your table view cell")
        }
        
        var listContentConfiguration = cell.defaultContentConfiguration()
        listContentConfiguration.text = "List type \(indexPath.row + 1)"
        cell.contentConfiguration = listContentConfiguration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TableViewListViewController") as? TableViewListViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        default:
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ScrollViewListViewController") as? ScrollViewListViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
