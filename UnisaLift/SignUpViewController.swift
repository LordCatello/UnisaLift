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
    
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var surnameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var carModelField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carModelField.delegate = self
        self.emailField.delegate = self
        self.nameField.delegate = self
        self.surnameField.delegate = self
      nameField.setBottomBorder()
      emailField.setBottomBorder()
        surnameField.setBottomBorder()
        carModelField.setBottomBorder()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailField.text = email
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
