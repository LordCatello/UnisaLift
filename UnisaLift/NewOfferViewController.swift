//
//  NewOfferViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class NewOfferViewController: UIViewController, UITextFieldDelegate {
    
    //var departurePlace, arrivePlace: String

    
    @IBOutlet weak var ArriveTextField: UITextField!
    
    @IBOutlet weak var SeatsTextField: UITextField!
    @IBAction func AddOfferButtonPressed(_ sender: Any) {
        PersistenceManager.newDefaultOffer()
         self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ArriveTextField.delegate = self
        self.SeatsTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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
