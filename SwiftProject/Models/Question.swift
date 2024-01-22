//
//  Question.swift
//  SwiftProject
//
//  Created by Варвара Уткина on 10.01.2024.
//

struct Question {
    let title: String
    let type: ResponseType
    let image: String?
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какая функция используется для преобразования элементов массива в новый массив?",
                type: .simple,
                image: nil,
                answers: [
                    Answer(title: "reduce", type: .wrong),
                    Answer(title: "map", type: .correct),
                    Answer(title: "compactMap", type: .wrong),
                    Answer(title: "sorted", type: .wrong)
                ].shuffled()
            ),
            Question(
                title: "Какая функция используется для фильтрации элементов массива?",
                type: .simple,
                image: nil,
                answers: [
                    Answer(title: "map", type: .wrong),
                    Answer(title: "filter", type: .correct),
                    Answer(title: "compactMap", type: .wrong),
                    Answer(title: "sorted", type: .wrong)
                ].shuffled()
            ),
            Question(
                title: "Какая функция используется для преобразования элементов массива и удаления всех nil значений?",
                type: .simple,
                image: nil,
                answers: [
                    Answer(title: "map", type: .wrong),
                    Answer(title: "compactMap", type: .correct),
                    Answer(title: "flatMap", type: .wrong),
                    Answer(title: "sorted", type: .wrong)
                ].shuffled()
            ),
            Question(
                title: "Что делает функция shuffled()?",
                type: .simple,
                image: nil,
                answers: [
                    Answer(title: "удаляет рандомный элемент из массива", type: .wrong),
                    Answer(title: "добавляет элемент в массив", type: .wrong),
                    Answer(title: "изменяет порядок массивов случайным образом", type: .correct),
                    Answer(title: "меняет значение параметра с true на false, и наоборот", type: .wrong)
                ].shuffled()
            ),
            Question(
                title: "Какая функция используется для преобразования массива массивов в один массив?",
                type: .simple,
                image: nil,
                answers: [
                    Answer(title: "compactMap", type: .wrong),
                    Answer(title: "reduce", type: .wrong),
                    Answer(title: "map", type: .wrong),
                    Answer(title: "flatMap", type: .correct)
                ].shuffled()
            ),
            Question(
                title: "Что выведет консоль?",
                type: .withImage,
                image: "QuestionFunc1",
                answers: [
                    Answer(title: "[2, 4, 6, 8, 10]", type: .correct),
                    Answer(title: "[1, 2, 3, 4, 5]", type: .wrong),
                    Answer(title: "[0, 0, 0, 0, 0]", type: .wrong)
                ].shuffled()
            )
        ]
    }
}

enum ResponseType {
    case simple
    case withImage
}

struct Answer {
    let title: String
    let type: QuestionType
}

enum QuestionType {
    case correct    
    case wrong
}
