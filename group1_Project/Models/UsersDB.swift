//
//  UsersDB.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-28.
//

import Foundation

class UsersDataSource {
    
    static let shared = UsersDataSource()
    var users:[User] = []
    
    // private initializer
    private init() {
        users.append(User(name: "Johnny Bravo", email: "john@gmail.com", pass: "johnny"))
        users.append(User(name: "Logan", email: "logan@gmail.com", pass: "wolverine"))
    }
    
    func getUserList() -> [User] {
        return users
    }
    
    

}
