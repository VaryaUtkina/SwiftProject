//
//  MistakeViewController.swift
//  SwiftProject
//
//  Created by Варвара Уткина on 16.01.2024.
//

import UIKit

final class MistakeViewController: UITableViewController {

    var correctAnswers: [Answer]!
    var answersChosen: [Answer]!
    var questions: [Question]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        var wrongAnswers: [Answer] = []
        for (index, answer) in answersChosen.enumerated() {
            if answer.type != correctAnswers[index].type {
                wrongAnswers.append(answer)
            } else {
                continue
            }
        }
        
        return wrongAnswers.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var wrongAnswers: [Answer] = []
        var wrongQuestions: [Question] = []
        for (index, answer) in answersChosen.enumerated() {
            if answer.type != correctAnswers[index].type {
                wrongAnswers.append(answer)
                wrongQuestions.append(questions[index])
            } else {
                continue
            }
        }
        return wrongQuestions[section].title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mistakeCell", for: indexPath)
        
        var wrongAnswers: [Answer] = []
        var wrongQuestions: [Question] = []
        for (index, answer) in answersChosen.enumerated() {
            if answer.type != correctAnswers[index].type {
                wrongAnswers.append(answer)
                wrongQuestions.append(questions[index])
            } else {
                continue
            }
        }
      
        var content = cell.defaultContentConfiguration()
        content.text = answersChosen[indexPath.section].title
        content.secondaryText = correctAnswers[indexPath.section].title
        cell.contentConfiguration = content
        
        return cell
    }

}
