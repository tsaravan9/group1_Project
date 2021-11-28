import UIKit

class ViewController: UIViewController {
    
    //MARK: outlets

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPass: UITextField!
    @IBOutlet weak var isRememberSelected: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: actions
    @IBAction func loginAction(_ sender: Any) {
        if let email = self.textEmail.text, let pass = self.textPass.text{
            if(email != "" && pass != ""){
                
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

