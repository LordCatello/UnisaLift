//
//  ModificaProfiloViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 19/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class ModificaProfiloViewController: UIViewController {
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
