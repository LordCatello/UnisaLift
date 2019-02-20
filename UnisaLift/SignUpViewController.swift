//
//  SignUpViewController.swift
//  UnisaLift
//
//  Created by DArmino Emanuele on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
extension UIStackView : UITextFieldDelegate{
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
}

class SignUpViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var TableViewElementi: UITableView!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var surnameField: UITextField!
    
    @IBOutlet weak var StackViewElementi: UIStackView!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var carModelField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carModelField.delegate = StackViewElementi
        self.emailField.delegate = StackViewElementi
        self.nameField.delegate = StackViewElementi
        self.surnameField.delegate = StackViewElementi
      nameField.setBottomBorder()
      emailField.setBottomBorder()
        surnameField.setBottomBorder()
        carModelField.setBottomBorder()
        // Do any additional setup after loading the view.
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
