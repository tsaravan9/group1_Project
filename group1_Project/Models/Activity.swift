//
//  Activity.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-28.
//

import Foundation

class Activity {
    let name:String
    let pricePerPerson:Double
    let activityDetails:ActivityDetails
    
    init(name:String, pricePerPerson:Double, activityDetails:ActivityDetails){
        self.name = name
        self.pricePerPerson = pricePerPerson
        self.activityDetails = activityDetails
    }
}