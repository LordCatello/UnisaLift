//
//  UserLoginViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 18/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

extension UITextField{
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.7)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    
    }
}

class UserLoginViewController: UIViewController, UITextFieldDelegate {
    //var DataBaseStudenti = ["Carmine","Emanuele"]
    
    var user: User!
    var emailField: String!

    @IBOutlet weak var LabelTopColor: UILabel!
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBAction func LoginButtonPressed(_ sender: Any) {
        emailField = EmailTextField.text!
        
        if(emailField == "") {
            return
        }
        
        // eseguo la fetch per l'utente con la mail specificata
        user = PersistenceManager.fetchUser(email: emailField)
        
        if( user != nil) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.userLoggedEmail = user.email
            performSegue(withIdentifier: "Home", sender: nil)
            
        } else {
            // se non sono presente nel database faccio la registrazione
            // è una soluzione temporanea
            // quindi se l'email non esiste ci si registra in ogni caso
            
            performSegue(withIdentifier: "Registrazione", sender: nil)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.EmailTextField.delegate = self
        self.PasswordTextField.delegate = self
        EmailTextField.setBottomBorder()
        PasswordTextField.setBottomBorder()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        switch segue.identifier{
            
        case "Registrazione":
            let destView = segue.destination as! RegistrazioneViewController
            destView.email = emailField
        default:
            return
            
            
        }
    }
 

}
