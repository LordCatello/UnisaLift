//
//  SignUpViewController.swift
//  UnisaLift
//
//  Created by DArmino Emanuele on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
extension UIView : UITextFieldDelegate{
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
}

class SignUpViewController: UIViewController, UITextFieldDelegate {
    var email : String!
    
    @IBAction func fineButtonPressed(_ sender: Any) {
        let name = nameField.text
        let surname = surnameField.text
        let carModel = carModelField.text
        
        if(name == "" || surname == "" || carModel == "") {
            // dovrei mostrare un messaggio in cui avverto che tutti i campi devono essere compilati
        }
        else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.userLogged = PersistenceManager.newUser(carModel: carModel!, email: email, name: name!, surname: surname!)
            performSegue(withIdentifier: "homeFromSignUp", sender: nil)
        }
    }
    
    @IBOutlet weak var TableViewElementi: UITableView!
    
    
    
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ViewElementi: UIView!
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var carModelField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carModelField.delegate = ViewElementi
        self.emailField.delegate = ViewElementi
        self.nameField.delegate = ViewElementi
        self.surnameField.delegate = ViewElementi
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailField.text = email
    }

}

