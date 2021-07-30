//
//  TableViewController.swift
//  TableViewController
//
//  Created by Alexander Bonney on 7/30/21.
//

import UIKit
import WebKit

class TableViewController: UITableViewController {
    
    static let websites: [String] = Bundle.main.decode("websites.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        title = "Browser"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewController.websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = TableViewController.websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        vc.webSite = TableViewController.websites[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

