//
//  ActivityDashBoardController.swift
//  group1_Project
//
//  Created by Graphic on 2021-11-28.
//

import UIKit

class ActivityDashBoardController: UIViewController {

    let USER_NAME:String = "username"
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(LogoutClicked))
    }
    
    @objc func LogoutClicked(){
        userDefault.removeObject(forKey: USER_NAME)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextScreen = storyBoard.instantiateViewController(withIdentifier: "login") as! ViewController
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    

}
