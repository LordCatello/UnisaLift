//
//  NewOfferViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MapKit

class NewOfferViewController: UIViewController, UITextFieldDelegate {
    //var departurePlace, arrivePlace: String
    var startPointDesc: String!
    var endPointDesc: String!
    var startPointLocation: CLLocation!
    var endPointLocation: CLLocation!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var totalSpotsField: UITextField!
    
    @IBOutlet weak var messageField: UITextView!
    
    @IBAction func chooseItineraryButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "chooseItinerary", sender: nil)
    }
    
    @IBAction func unwindToNewOffer(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func AddOfferButtonPressed(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        let date = datePicker.date
        let totalSpots = totalSpotsField.text
        let message = messageField.text
        
        if(totalSpots == "" || message == "" || startPointDesc == nil || endPointDesc == nil || startPointDesc == "" || endPointDesc == "" || startPointLocation == nil || endPointLocation == nil) {
            // dovrei mostrare un messaggio in cui avverto che tutti i campi devono essere compilati
        } else {
        
            let startPointLat = startPointLocation.coordinate.latitude as Double
            let startPointLong = startPointLocation.coordinate.longitude as Double
            let endPointLat = endPointLocation.coordinate.latitude as Double
            let endPointLong = endPointLocation.coordinate.longitude as Double
            
            let totalSpotsInt = Int(totalSpots!)
        
            PersistenceManager.newOffer(endPointDesc: endPointDesc, message: message!, startDate: date, startPointDesc: startPointDesc, totalSpots: totalSpotsInt!, offerer: userLogged!, startPointLat: startPointLat, startPointLong: startPointLong, endPointLat: endPointLat, endPointLong: endPointLong)
        
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var partenzaLabel: UILabel!
    
    
    @IBOutlet weak var arrivoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalSpotsField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(startPointDesc != nil){
            partenzaLabel.text = startPointDesc
        }
        
        if(endPointDesc != nil){
            arrivoLabel.text = endPointDesc
        }
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

