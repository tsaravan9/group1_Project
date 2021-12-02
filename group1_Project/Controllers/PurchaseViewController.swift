//
//  PurchaseViewController.swift
//  group1_Project
//
//  Created by Jagsifat Makkar on 2021-11-29.
//

import UIKit

class PurchaseViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var numOfTickets: UILabel!
    @IBOutlet weak var ticketStepper: UIStepper!
    
    let USER_NAME:String = "username"
    let userDefault = UserDefaults.standard 
    
    var activity : Activity? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityName.text = activity!.name
        ticketStepper.maximumValue = 5
        ticketStepper.minimumValue = 1
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))

        // Do any additional setup after loading the view.
    }
    
    @IBAction func purchasePressed(_ sender: Any) {
        
        if username.text!.isEmpty{
            let alertController = UIAlertController(title: "ERROR", message: "Purchaser name cannot be empty!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        guard let loggedInUser = UserDefaults.standard.string(forKey: "loggedInUser") else {
            return
        }
        var tickets = UserDefaults.standard.array(forKey: "\(loggedInUser).tickets") as? [String] ?? [String]()
        tickets.append("\(activity!.name).\(numOfTickets.text ?? "1").\(username.text ?? "")")
        UserDefaults.standard.set(tickets, forKey: "\(loggedInUser).tickets")
        let alertController = UIAlertController(title: "SUCCESS", message: "Tickets purchased for the activity!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func LogoutClicked(){
        userDefault.set("", forKey: "loggedInUser")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func stepperPressed(_ sender: Any) {
        numOfTickets.text = String(Int(Double(ticketStepper.value.description)!))
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
