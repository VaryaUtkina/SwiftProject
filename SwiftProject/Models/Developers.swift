//
//  Developers.swift
//  SwiftProject
//
//  Created by Варвара Уткина on 05.01.2024.
//

struct Developer {
    let name: String
    let role: Role
    let developedQuiz: String
    let photo: String
    
    static func getDevelopers() -> [Developer] {
        let team: [Developer] = [
            Developer(name: "TeamLead", role: .teamLead, developedQuiz: "Экран", photo: "personPhoto"),
            Developer(name: "Варя", role: .developer, developedQuiz: "Экран разработчиков", photo: "varyaPhoto"),
            Developer(name: "Костя", role: .developer, developedQuiz: "Экран", photo: "personPhoto"),
            Developer(name: "Саша", role: .developer, developedQuiz: "Экран", photo: "sashaPhoto"),
            Developer(name: "Антон", role: .developer, developedQuiz: "Экран", photo: "antonPhoto"),
            Developer(name: "Максим", role: .developer, developedQuiz: "Экран", photo: "personPhoto"),
            ]
        
        return team
    }
}

enum Role: String {
    case teamLead = "Teamlead"
    case developer = "Developer"
}
