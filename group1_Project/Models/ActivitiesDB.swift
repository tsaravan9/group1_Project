//
//  ActivitiesDB.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-28.
//

import Foundation

class ActivitiesDataSource {
    
    static let shared = ActivitiesDataSource()
    var activities:[Activity] = []
    
    // private initializer
    private init() {
        activities.append(Activity("Bike Tour", 50, ActivityDetails("We are proud to be Amsterdam's smallest bike tour company! We work with a maximum of 12 participants (usually less!) per tour group to ensure you a personal and high quality tour. This three hour bike tour focuses on Amsterdam's undiscovered area's and the city's hidden gems. We will meet each other at our office in Amsterdam's city centre to pick up our first class bikes. You will discover secret courtyards, hidden churches and off-the-beaten path neighborhoods. While crossing canals and cruising through parks you will learn about Amsterdam fascinating history as well as the current city life of Amsterdammers. Hop on and we'll bike the extra mile!",3, "Bike Bulldozer", ["bike_tour_1", "bike_tour_2"], "1234567890")))
        activities.append(Activity("Van Gogh Cruise", 75, ActivityDetails("Dedicated to the Netherlands’ most famous artist, the Van Gogh Museum draws crowds throughout the year—so booking ahead is essential. Secure your place with this discounted combo ticket, which includes a classic Amsterdam canal cruise with an audio guide. Visit the Van Gogh Museum at the time slot you’ve selected; use your canal cruise ticket whenever works for you.",4, "Van Ear", ["van_gogh_1", "van_gogh_2"], "1234567899")))
        activities.append(Activity("Anne Frank Tour", 30, ActivityDetails("This tour makes it super easy to pack in a little daytime history in between exploring Amsterdam’s vibrant nightlife. Even if you’re planning on visiting the Anne Frank House separately on your own, this tour follows her path through the city’s the Jewish Quarter with a guide who’s well brushed up on his WWII history.", 4, "Respect Frank", ["anne_frank_1", "anne_frank_2"], "1234567895")))
        activities.append(Activity("Open Boat Tour", 100, ActivityDetails("Amsterdam is best explored by water, and this affordable boat cruise gives you unobstructed views of canal-side attractions like the Anne Frank House and Hermitage Museum. The boat’s small size and comfortable seating mean you won't be jostled by crowds, and you can enjoy unlimited Heineken beer, wine, and soft drinks while gliding through Amsterdam’s UNESCO-listed waterways.", 3, "Guide God", ["boat_tour_1", "boat_tour_2"], "1234567892")))
        activities.append(Activity("XtraCold", 150, ActivityDetails("XtraCold Icebar offers a chilled out experience for visitors looking for something beyond Amsterdam’s vibrant coffee shop and club scene. Forget waiting in line with fast-track entry to this venue that’s kept as cold as ice, and get into the spirit with three drinks included. Admire artwork, glasses, and more made out of ice, while keeping warm in a provided thermal jacket.", 5, "Cold Ice", ["xtreme_1", "xtreme_2"], "1234567891")))
        
    }
    
    func getActivitiesList() -> [Activity] {
        return self.activities
    }
    
    func getActivityFromName(name:String) -> Activity?{
        for activity in self.activities {
            if (name == activity.name){
                return activity
            }
        }
        return nil
    }
    
}
