//
//  SignUpViewController.swift
//  UnisaLift
//
//  Created by DArmino Emanuele on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var email : String!
    var imageData: NSData!
    
    @IBAction func fineButtonPressed(_ sender: Any) {
        let name = nameField.text
        let surname = surnameField.text
        let carModel = carModelField.text
        
        if(name == "" || surname == "" || carModel == "") {
            // dovrei mostrare un messaggio in cui avverto che tutti i campi devono essere compilati
        }
        else {
            if(imageData == nil) {
                let image = #imageLiteral(resourceName: "profile")
                imageData = image.jpegData(compressionQuality: 0.5) as! NSData
            }
                
                
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.userLogged = PersistenceManager.newUser(carModel: carModel!, email: email, name: name!, surname: surname!, imageFullRes: imageData)
            performSegue(withIdentifier: "homeFromSignUp", sender: nil)
        }
    }
    
    @IBOutlet weak var TableViewElementi: UITableView!
    
    
    
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ViewElementi: UIView!
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var carModelField: UITextField!
    
    @IBOutlet weak var profile: UIImageView!
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        //challenge
        imagePicker.setEditing(true, animated: true)
        
        
        // If the device has a camera, take a picture, otherwise,
        // just pick from photo library
        
        
        /* if UIImagePickerController.isSourceTypeAvailable(.camera) {
         imagePicker.sourceType = .camera
         
         } else {*/
        imagePicker.sourceType = .photoLibrary
        //}
        
        imagePicker.delegate = self
        
        // Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        let image1 = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        // Store the image in the ImageStore for the item's key
        //imageStore.setImage(image1, forKey: item.itemKey)
        
        // Put that image onto the screen in our image view
        
        profile.image = image1
        
        
      //  var imageData  = image1.pngData()! as Data
        
        imageData = image1.jpegData(compressionQuality: 0.5) as! NSData
        
       
         
        // Take image picker off the screen -
        // you must call this dismiss method
        dismiss(animated: true, completion: nil)
    }
    
    
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
    
    @IBAction func tapOnView(_ sender: Any) {
        nameField.resignFirstResponder()
        surnameField.resignFirstResponder()
        carModelField.resignFirstResponder()
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
    
    override func viewWillAppear(_ animated: Bool) {
        emailField.text = email
    }
    
}

