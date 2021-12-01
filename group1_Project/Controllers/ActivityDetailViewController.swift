//
//  ActivityDetailViewController.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-29.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    var activity : Activity? = nil
    let USER_NAME:String = "username"
    let userDefault = UserDefaults.standard 
    
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityImageView2: UIImageView!
    @IBOutlet weak var activityDescription: UILabel!
    @IBOutlet weak var activityHostName: UILabel!
    @IBOutlet weak var activityHostContact: UILabel!
    @IBOutlet weak var btnText: UIButton!
    
    @IBOutlet weak var activityPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))

        // Do any additional setup after loading the view.
        displayDetails()
    }
    
    @objc func LogoutClicked(){
        userDefault.removeObject(forKey: USER_NAME)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func displayDetails(){
        
        guard let receivedActivity = self.activity else{
            self.activityTitle.text = "Unavailable"
            self.activityDescription.text = "Unavailable"
            self.activityHostContact.text = "Unavailable"
            self.activityImageView.image = UIImage(named: "")
            return
        }
        
        self.activityTitle.text = receivedActivity.name
        self.activityPrice.text = "Price: $ \(receivedActivity.pricePerPerson)/person"
        self.activityDescription.text = receivedActivity.activityDetails!.description
        self.activityImageView.image = UIImage(named: receivedActivity.activityDetails!.imgSources[0])
        self.activityImageView2.image = UIImage(named: receivedActivity.activityDetails!.imgSources[1])
        self.activityHostName.text = "Host Name: \(receivedActivity.activityDetails!.hostName)"
        self.activityHostContact.text = "Host Contact:"
        self.btnText.titleLabel?.text = "\(receivedActivity.activityDetails!.hostContact)"
    }
    
    @IBAction func activityShareClicked(_ sender: Any) {
        let shareContent = UIActivityViewController(activityItems: ["Check out this dope activity in Amsterdam! - \n\n\(self.activity!.name) \n\nPrice : $ \(self.activity!.pricePerPerson)/person"], applicationActivities: nil)
        shareContent.popoverPresentationController?.sourceView = self.view
        self.present(shareContent, animated: true, completion: nil)
    }
    
    @IBAction func gotoDialer(_ sender: Any) {
        if let url = URL(string: "tel://\(self.activity!.activityDetails?.hostContact ?? "1234567890")"),
        UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func favoritePressed(_ sender: Any) {
        guard let loggedInUser = UserDefaults.standard.string(forKey: "username") else {
            return
        }
        var favList = UserDefaults.standard.array(forKey: "\(loggedInUser).favorites") as? [String] ?? [String]()
        for item in favList{
            if item == self.activity!.name{
                let alertController = UIAlertController(title: "ERROR", message: "Activity already in favorites!", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
        }
        favList.append(activity!.name)
        UserDefaults.standard.set(favList, forKey: "\(loggedInUser).favorites")
        let alertController = UIAlertController(title: "Hurray!!", message: "Activity added to favorites!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func purchaseTicketsPressed(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let nextScreen = storyBoard.instantiateViewController(withIdentifier: "purchase") as? PurchaseViewController else{
            return
        }
        nextScreen.activity = self.activity
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
}
