//
//  NewOfferViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MapKit

class NewOfferViewController: UIViewController, UITextFieldDelegate , UITextViewDelegate{
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
        self.messageField.delegate = self
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
            moveTextField(textField, moveDistance: -250, up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        
            moveTextField(textField, moveDistance: -250, up: false)
        }
    
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        moveTextView(textView, moveDistance: -250, up: true)
    }
    
    // Finish Editing The Text Field
    func textViewDidEndEditing(_ textView: UITextView) {
        moveTextView(textView, moveDistance: -250, up: false)
    }
    
    // Hide the keyboard when the return key pressed
    
    
    // Move the text field in a pretty animation!
    func moveTextView(_ textView: UITextView, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

