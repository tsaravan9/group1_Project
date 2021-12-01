//
//  FavoritesViewController.swift
//  group1_Project
//
//  Created by Jagsifat Makkar on 2021-11-29.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    let USER_NAME:String = "username"
    let userDefault = UserDefaults.standard
    var favList = UserDefaults.standard.array(forKey: "\(UserDefaults.standard.string(forKey: "username") ?? "").favorites") as? [String] ?? [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.rowHeight = 150
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
        return favList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteActivityCell", for: indexPath) as! FavoriteActivityCell

        // Configure the cell...
        let currentActivityName = self.favList[indexPath.row]
        let currentActivity = Activity(currentActivityName)
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
        
        let currentActivityName = self.favList[indexPath.row]
        let currentActivity = Activity(currentActivityName)
        detailScreen.activity = currentActivity
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.favList.remove(at: indexPath.row)
            guard let loggedInUser = UserDefaults.standard.string(forKey: "username") else {
                return
            }
            UserDefaults.standard.set(favList, forKey: "\(loggedInUser).favorites")
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    @IBAction func removeAllPressed(_ sender: Any){
        guard let loggedInUser = UserDefaults.standard.string(forKey: "username") else {
            return
        }
        favList = [String]()
        UserDefaults.standard.set(favList, forKey: "\(loggedInUser).favorites")
        self.myTableView.reloadData()
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
