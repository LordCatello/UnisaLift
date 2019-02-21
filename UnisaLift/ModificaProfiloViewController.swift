//
//  ModificaProfiloViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 19/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MobileCoreServices

class ModificaProfiloViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var car: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var changeImageButton: UIButton!
    @IBOutlet weak var surnameText: UITextField!
    
    @IBOutlet weak var mailText: UITextField!
    
    @IBOutlet weak var carText: UITextField!
    
    @IBOutlet weak var descriptionArea: UITextView!
    
    
    
    
    
    
    
    
    @IBAction func FattoButtonPressed(_ sender: Any) {
        
   /*
        self.tabBarController?.selectedIndex = 2
        */
        //self.navigationController?.popViewController(animated: true)
       // self.dismiss(animated: true, completion: nil)
        
        performSegue(withIdentifier: "impostazioni", sender: nil)
    }
    
    @IBAction func takePicture(_ sender: Any) {
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
        
        image.image = image1
        
        // Take image picker off the screen -
        // you must call this dismiss method
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePicture(_ sender: Any) {
        
       
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
            
            image.image = image1
            
            // Take image picker off the screen -
            // you must call this dismiss method
            dismiss(animated: true, completion: nil)
        }
    

        
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     
        
        
    
    
    }
}
