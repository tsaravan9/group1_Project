//
//  Activity.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-28.
//

import Foundation

class Activity {
    let name:String
    var pricePerPerson:Double = 0
    var activityDetails:ActivityDetails? = nil
    
    init(_ name:String,_ pricePerPerson:Double,_ activityDetails:ActivityDetails){
        self.name = name
        self.pricePerPerson = pricePerPerson
        self.activityDetails = activityDetails
    }
    
    init(_ name:String){
        self.name = name
        let activitiesList = ActivitiesDataSource.shared.getActivitiesList()
        for item in activitiesList{
            if name == item.name{
                self.pricePerPerson = item.pricePerPerson
                self.activityDetails = item.activityDetails
            }
        }
    }
}
