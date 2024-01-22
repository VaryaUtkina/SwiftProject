//
//  ResultViewController.swift
//  SwiftProject
//
//  Created by Варвара Уткина on 13.01.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    // MARK: - Public Properties
    var answers: [Answer]!
    var correctAnswers: [Answer]!
    var questions: [Question]!
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }

    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mistakeVC = segue.destination as? MistakeViewController else { return }
        mistakeVC.correctAnswers = correctAnswers
        mistakeVC.answersChosen = answers
        mistakeVC.questions = questions
    }

    // MARK: - IB Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

// MARK: - Private Methods
extension ResultViewController {
    private func updateResult() {
        let correctAnswers = answers.filter { $0.type == .correct }
        let score = correctAnswers.count
        let resultPercent = Double(score) / Double(answers.count)
        
        switch resultPercent {
        case 0 ..< 0.75:
            resultImage.image = UIImage(named: "failed")
            resultLabel.text = "Миссия провалена"
        default:
            resultImage.image = UIImage(named: "succeed")
            resultLabel.text = "Успешный успех"
        }
        
        scoreLabel.text = """
Правильных ответов:
\(score) из \(answers.count)
"""
        
    }
}
