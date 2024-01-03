//
//  ViewController.swift
//  SwiftProject
//
//  Created by Варвара Уткина on 03.01.2024.
//

import UIKit

class DevelopersViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "devCell", for: indexPath)
        cell.textLabel?.text = "Cell index \(indexPath.description)"
        return cell
    }

}

