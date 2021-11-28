//
//  User.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-28.
//

import Foundation

class User{
    let name:String
    let email:String
    let pass:String
    var favourites: [Activity] = []
    var ticketsPurchased: [Activity] = []
    
    init(name:String, email:String, pass:String){
        self.name = name
        self.email = email
        self.pass = pass
    }
}
