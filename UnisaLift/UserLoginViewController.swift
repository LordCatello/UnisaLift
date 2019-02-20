//
//  UserLoginViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 18/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit


extension UIButton{
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIButton.animate(withDuration: 0.02,
                         animations: {
                            self.transform = CGAffineTransform(scaleX: 0.900, y: 0.900)
                            self.alpha = 0.7
        })
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIButton.animate(withDuration: 0.02, animations: {
            super.touchesEnded(touches, with: event)
            self.transform = CGAffineTransform.identity
            self.alpha = 1.0
        })
    }
}

extension UITextField{
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.7)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    
    }
}

class UserLoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var LoginButton: UIButton!
    
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
            appDelegate.userLogged = user
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
        
        let id = PersistenceManager.fetchProgressiveID()
        
        // creo un id progressivo che inizia con 0
        if(id == nil) {
            PersistenceManager.newProgressiveID()
        }
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
            let destView = segue.destination as! SignUpViewController
            destView.email = emailField
        default:
            return
            
            
        }
    }
 

}
