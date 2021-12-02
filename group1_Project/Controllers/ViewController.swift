import UIKit

class ViewController: UIViewController {
    
//    let USER_NAME:String = "username"
    
    let userDefault = UserDefaults.standard
    let users = UsersDataSource.shared.getUserList()
    var username = ""
    
    //MARK: outlets
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPass: UITextField!
    @IBOutlet weak var isRememberSelected: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        userDefault.removeObject(forKey: USER_NAME)
        checkIfUserLoggedIn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textPass.text = ""
        textEmail.text = ""
    }

    func checkIfUserLoggedIn(){
        let username = userDefault.string(forKey: "loggedInUser") ?? ""
        let rememberMe = userDefault.string(forKey: "\(username).rememberMe") ?? ""
        if rememberMe == "on"{
            gotoDashboardPage()
        }
    }
    
    func gotoDashboardPage(){
        print(#function,"going to dashboard Page")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nextScreen = storyBoard.instantiateViewController(withIdentifier: "dashboard") as! ActivityDashboardTableViewController
        self.navigationController?.pushViewController(nextScreen, animated: true)
        self.navigationItem.backBarButtonItem?.isEnabled = false
    }
    
    //MARK: actions
    @IBAction func loginAction(_ sender: Any) {
        if let email = self.textEmail.text, let pass = self.textPass.text{
            if(email != "" && pass != ""){
                for user in users {
                    if(user.email == email && user.pass == pass){
                        if(self.isRememberSelected.isOn){
                            userDefault.set("on", forKey: "\(user.name).rememberMe")
                        }
                        else{
                            userDefault.set("off", forKey: "\(user.name).rememberMe")
                        }
                        userDefault.set(user.name, forKey: "loggedInUser")
                        gotoDashboardPage()
                    }else if((user.email == email && user.pass != pass)){
                        let alertController = UIAlertController(title: "Unable to proceed", message: "Please check your email and password", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }else{
                print(#function, "Email or password cannot be empty")
                let alertController = UIAlertController(title: "Unable to proceed", message: "Email or password cannot be empty", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }else{
            print(#function, "email or pass cannot be nil" )
        }
    }
    
}

