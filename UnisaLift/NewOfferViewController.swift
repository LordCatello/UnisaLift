//
//  NewOfferViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class NewOfferViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var totalSpotsField: UITextField!
    
    @IBOutlet weak var messageField: UITextView!
    
    @IBAction func chooseItineraryButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "chooseItinerary", sender: nil)
    }
    
    @IBAction func AddOfferButtonPressed(_ sender: Any) {
        /*
        if(name == "" || surname == "" || carModel == "") {
            // dovrei mostrare un messaggio in cui avverto che tutti i campi devono essere compilati
        }
        */
        

        
        PersistenceManager.newDefaultOffer()
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalSpotsField.delegate = self
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
