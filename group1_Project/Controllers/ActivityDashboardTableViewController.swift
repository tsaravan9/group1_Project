//
//  ActivityDashboardTableViewController.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-29.
//

import UIKit

class ActivityDashboardTableViewController: UITableViewController {
    
    let USER_NAME:String = "username"
    let userDefault = UserDefaults.standard
    let activitiesList = ActivitiesDataSource.shared.getActivitiesList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let alertController = UIAlertController(title: "Greetings!", message: "Welcome to Amsterdam, \(userDefault.string(forKey: "loggedInUser") ?? "") :)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Proceed", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
        let historyButton = UIBarButtonItem(title: "History", style: .plain, target: self, action: #selector(HistoryClicked))
        self.navigationItem.rightBarButtonItems = [logoutButton, historyButton]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Favorites", style: .plain, target: self, action: #selector(FavoritesClicked))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.rowHeight = 150
    }
    
    @objc func LogoutClicked(){
        userDefault.set("", forKey: "loggedInUser")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func FavoritesClicked(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nextScreen = storyBoard.instantiateViewController(withIdentifier: "favoritesList") as! FavoritesTableViewController
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @objc func HistoryClicked(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nextScreen = storyBoard.instantiateViewController(withIdentifier: "ticketHistory") as! PurchaseHistoryTableViewController
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activitiesList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityCell

        // Configure the cell...
        let currentActivity = self.activitiesList[indexPath.row]
        cell.activityTitle.text = currentActivity.name
        cell.activityPricePerPerson.text = "Price: $\(currentActivity.pricePerPerson)/person"
        cell.activityImage.image = UIImage(named: currentActivity.activityDetails!.imgSources[0])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailScreen = storyboard?.instantiateViewController(withIdentifier: "activityDetailScreen") as? ActivityDetailViewController else{
            
            print(#function, "Unable to find detail screen")
            return
        }
        
        detailScreen.activity = self.activitiesList[indexPath.row]
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }

}
