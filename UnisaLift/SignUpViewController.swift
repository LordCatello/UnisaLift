//
//  SignUpViewController.swift
//  UnisaLift
//
//  Created by DArmino Emanuele on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var email : String!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
