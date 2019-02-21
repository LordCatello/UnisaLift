//
//  SignUpViewController.swift
//  UnisaLift
//
//  Created by DArmino Emanuele on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit


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
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == carModelField {
            TableViewElementi.isScrollEnabled = false
            moveTextField(textField, moveDistance: -250, up: true)
        }
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == carModelField {
            TableViewElementi.isScrollEnabled = true
            moveTextField(textField, moveDistance: -250, up: false)
        }}
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carModelField.delegate = self
        self.emailField.delegate = self
        self.nameField.delegate = self
        self.surnameField.delegate = self
        
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailField.text = email
    }
    
}

