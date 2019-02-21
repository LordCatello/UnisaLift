//
//  ModificaProfiloViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 19/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MobileCoreServices

class ModificaProfiloViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var TableViewElements: UITableView!
    @IBOutlet weak var ViewElements: UIView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var changeImageButton: UIButton!
    @IBOutlet weak var surnameText: UITextField!
    
    @IBAction func tapForKeyBoard(_ sender: UITapGestureRecognizer) {
        nameText.resignFirstResponder()
        surnameText.resignFirstResponder()
        carText.resignFirstResponder()
    }
    
    @IBOutlet weak var carText: UITextField!
    
    
    @IBAction func FattoButtonPressed(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        if(nameText.text != ""){
        userLogged?.name = nameText.text
        }
        if(surnameText.text != ""){
        userLogged?.surname = surnameText.text
        }
        
   /*
        self.tabBarController?.selectedIndex = 2
        */
        //self.navigationController?.popViewController(animated: true)
       // self.dismiss(animated: true, completion: nil)
        
        performSegue(withIdentifier: "impostazioni", sender: nil)
    }
    
    @IBAction func takePicture(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.setEditing(true, animated: true)
        
        imagePicker.sourceType = .photoLibrary

        imagePicker.delegate = self
        
        // Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        let image1 = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        // Store the image in the ImageStore for the item's key
        //imageStore.setImage(image1, forKey: item.itemKey)
        
        // Put that image onto the screen in our image view
        
     //   image.image = image1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        var imageData = image1.jpegData(compressionQuality: 0.5) as! NSData
        userLogged?.imageFullRes = imageData
        
        
    
        
        // Take image picker off the screen -
        // you must call this dismiss method
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carText.delegate = self
        self.nameText.delegate = self
        self.surnameText.delegate = self
        
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged

        
        nameText.text = userLogged?.name
        surnameText.text = userLogged?.surname
        carText.text = userLogged?.carModel
        var profileimage = UIImage(data: userLogged?.imageFullRes as! Data, scale:1.0)
        image.image = profileimage
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == carText {
            TableViewElements.isScrollEnabled = false
            moveTextField(textField, moveDistance: -250, up: true)
        }
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == carText {
            TableViewElements.isScrollEnabled = true
            moveTextField(textField, moveDistance: -250, up: false)
        }}
    
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     
        
        
    
    
    }
}
