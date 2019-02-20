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
    
    var DataBaseStudenti = ["Carmine","Emanuele"]
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBAction func LoginButtonPressed(_ sender: Any) {
        if(EmailTextField.text!.description == ""){
        return
        }
        
        if(DataBaseStudenti.contains(EmailTextField.text!.description)){
            
            
            performSegue(withIdentifier: "Home", sender: nil)
            
        }else {
            performSegue(withIdentifier: "Registrazione", sender: nil)
        }
        
        
        
        
    }

    
  
    
    
//    @IBAction func ButtonAnimation(_ sender: UIButton) {
//
//        UIButton.animate(withDuration: 0.02,
//                         animations: {
//                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
//        },
//                         completion: { finish in
//                            UIButton.animate(withDuration: 0.01, animations: {
//                                sender.transform = CGAffineTransform.identity
//                            })
//
//        })
//
//    }
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

    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
