//
//  User.swift
//  quoteApp
//
//  Created by Дарина Самохина on 29.10.2022.
//

struct User {
    let login: String
    let password: String
    
    static func getUser() -> User {
        User(login: "Алексей", password: "1234")
    }
}
