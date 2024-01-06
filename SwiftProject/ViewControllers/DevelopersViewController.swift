//
//  ViewController.swift
//  SwiftProject
//
//  Created by Варвара Уткина on 03.01.2024.
//

import UIKit

final class DevelopersViewController: UITableViewController {
    private let team = Developer.getDevelopers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        let typesOfSections = Set(team.map {$0.role})
        return typesOfSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let typesOfSections = Set(team.map {$0.role})
        let sortedSections = Array(typesOfSections)
        let numberOfRows: Int
        switch sortedSections[section] {
        case .teamLead:
            numberOfRows = 1
        default:
            numberOfRows = 5
        }
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let role: Role
        if section == 0 {
            role = .teamLead
        } else {
            role = .developer
        }
        return role.rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "devCell", for: indexPath)
        
        
        if team[indexPath.section].role == .teamLead {
            let teamLead = team.filter { $0.role == .teamLead }
            let person = teamLead[indexPath.section]
            
            var content = cell.defaultContentConfiguration()
            content.text = person.name
            content.secondaryText = person.developedQuiz
            content.image = UIImage(named: person.photo)
            content.imageProperties.cornerRadius = tableView.rowHeight / 2
            cell.contentConfiguration = content
        } else {
            let developers = team.filter { $0.role == .developer }
            let person = developers[indexPath.row]
            
            var content = cell.defaultContentConfiguration()
            content.text = person.name
            content.secondaryText = person.developedQuiz
            content.image = UIImage(named: person.photo)
            content.imageProperties.cornerRadius = tableView.rowHeight / 2
            cell.contentConfiguration = content
        }
        
        return cell
    }
}

