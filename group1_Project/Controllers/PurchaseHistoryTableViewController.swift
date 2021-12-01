//
//  PurchaseHistoryTableViewController.swift
//  group1_Project
//
//  Created by Jagsifat Makkar on 2021-11-29.
//

import UIKit

class PurchaseHistoryTableViewController: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    let USER_NAME:String = "username"
    let userDefault = UserDefaults.standard
    var ticketsList = UserDefaults.standard.array(forKey: "\(UserDefaults.standard.string(forKey: "username") ?? "").tickets") as? [String] ?? [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //uncomment the below line to clear history
        //clearHistory()
        
        for i in ticketsList{
            print("\(i)")
        }

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.rowHeight = 275
    }
    
    @objc func LogoutClicked(){
        userDefault.removeObject(forKey: USER_NAME)
        self.navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ticketsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketCell

        // Configure the cell...
        let ticketName = self.ticketsList[indexPath.row]
        let ticketNameArr = ticketName.components(separatedBy: ".")
        let currentActivityName = ticketNameArr[0]
        let currentActivity = Activity(currentActivityName)
        cell.activityTitle.text = currentActivityName
        cell.activityPricePerPerson.text = "Price: $\(currentActivity.pricePerPerson)/person"
        cell.numOfTickets.text = ticketNameArr[1]
        cell.purchaserName.text = ticketNameArr[2]
        cell.totalCost.text = "$" + String(Double(ticketNameArr[1])!*currentActivity.pricePerPerson)
        cell.activityImage.image = UIImage(named: currentActivity.activityDetails!.imgSources[0])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailScreen = storyboard?.instantiateViewController(withIdentifier: "activityDetailScreen") as? ActivityDetailViewController else{
            
            print(#function, "Unable to find detail screen")
            return
        }
        
        let ticketName = self.ticketsList[indexPath.row]
        let ticketNameArr = ticketName.components(separatedBy: ".")
        let currentActivityName = ticketNameArr[0]
        let currentActivity = Activity(currentActivityName)
        detailScreen.activity = currentActivity
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }
    
    //this function is only used when purchase history needs to be cleared for any reason
    private func clearHistory(){
        guard let loggedInUser = UserDefaults.standard.string(forKey: "username") else {
            return
        }
        ticketsList = [String]()
        UserDefaults.standard.set(ticketsList, forKey: "\(loggedInUser).tickets")
        self.myTableView.reloadData()
    }

}
