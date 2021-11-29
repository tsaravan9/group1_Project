//
//  ActivityDetailViewController.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-29.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    var activity : Activity? = nil
    
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityDescription: UILabel!
    @IBOutlet weak var activityHostName: UILabel!
    @IBOutlet weak var activityHostContact: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayDetails()
    }
    
    private func displayDetails(){
        
        guard let receivedActivity = self.activity else{
            print(#function, "Pokemon details unavailable form previous screen")
            self.activityTitle.text = "Unavailable"
            self.activityDescription.text = "Pokemon details unavailable form previous screen"
            self.activityHostContact.text = "Unavailable"
//            self.activityImageView.image = UIImage(named: "")
            return
        }
        
        self.activityTitle.text = receivedActivity.name
        self.activityDescription.text = receivedActivity.activityDetails.description
//        self.activityImageView.image = UIImage(named: receivedActivity.activityDetails.imgSources[0])
        self.activityHostName.text = "Host Name: \(receivedActivity.activityDetails.hostName)"
        self.activityHostContact.text = "Host Contact: \(receivedActivity.activityDetails.hostContact)"
        
    }
    
    @IBAction func activityShareClicked(_ sender: Any) {
    }
    
    @IBAction func activityFavouriteClicked(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
