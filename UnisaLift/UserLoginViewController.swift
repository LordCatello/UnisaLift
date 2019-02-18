//
//  UserLoginViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 18/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    
    var DataBaseStudenti = ["Carmine","Emanuele"]

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        
        
        if(DataBaseStudenti.contains(EmailTextField.text!.description)){
            
            performSegue(withIdentifier: "Home", sender: nil)
            
        }else {
            performSegue(withIdentifier: "Registrazione", sender: nil)
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
