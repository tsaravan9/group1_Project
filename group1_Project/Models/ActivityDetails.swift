//
//  ActivityDetails.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-28.
//

import Foundation

class ActivityDetails{
    let description:String
    let starRating:Float
    let hostName:String
    let imgSources:[String]
    let hostContact:String
    var numberOfTicketsAvailable:Int = 5
    

    init (_ description:String,_ starRating:Float,_ hostName:String,_ imgSources:[String],_ hostContact:String) {
        self.description = description
        self.starRating = starRating
        self.hostName = hostName
        self.imgSources = imgSources
        self.hostContact = hostContact
    }
}
