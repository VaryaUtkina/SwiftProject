//
//  QuestionsViewController.swift
//  SwiftProject
//
//  Created by Варвара Уткина on 10.01.2024.
//

import UIKit

final class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var questionLabel: UINavigationItem!
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var fourQuestionStackView: UIStackView!
    @IBOutlet var buttonOfFour: [UIButton]!
    @IBOutlet var simpleQuestionLabel: UILabel!
    
    @IBOutlet var threeQuestionStackView: UIStackView!
    @IBOutlet var threeButtonStackView: UIStackView!
    @IBOutlet var buttonOfThree: [UIButton]!
    @IBOutlet var withImageQuestionLabel: UILabel!
    @IBOutlet var questionImageView: UIImageView!
    
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private var questionIndex = 0
    private let questions = Question.getQuestions().shuffled()
    private var answersChosen: [Answer] = []
    private var correctAnswers: [Answer] {
        questions.flatMap { $0.answers }.filter { $0.type == .correct }
    }
    private var currentQuestion: Question {
        questions[questionIndex]
    }
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.answers = answersChosen
        resultVC.correctAnswers = correctAnswers
        resultVC.questions = questions
    }
    
    // MARK: - Override Methods
    
    // MARK: - IB Actions
    @IBAction func buttonOfFourTapped(_ sender: UIButton) {
        guard let buttonIndex = buttonOfFour.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answersChosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func buttonOfThreeTapped(_ sender: UIButton) {
        guard let buttonIndex = buttonOfThree.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answersChosen.append(currentAnswer)
        nextQuestion()
    }
}

// MARK: - Private Methods
private extension QuestionsViewController {
    func updateUI() {
        for stackView in [fourQuestionStackView, threeQuestionStackView] {
            stackView?.isHidden = true
        }
        
        title = "Вопрос №\(questionIndex + 1) из \(questions.count)"

        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .simple: showFourQuestionStackView(with: currentAnswers)
        case .withImage: showThreeQuestionStackView(with: currentAnswers)
        }
    }
    
    func showFourQuestionStackView(with answers: [Answer]) {
        fourQuestionStackView.isHidden.toggle()
        simpleQuestionLabel.text = currentQuestion.title
        
        for (button, answer) in zip(buttonOfFour, answers) {
            button.setTitle(answer.title, for: .normal)
            button.titleLabel?.textAlignment = .center
        }
    }
    
    func showThreeQuestionStackView(with answers: [Answer]) {
        threeQuestionStackView.isHidden.toggle()
        withImageQuestionLabel.text = currentQuestion.title
        questionImageView.image = UIImage(named: currentQuestion.image ?? "")
        
        for (button, answer) in zip(buttonOfThree, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
