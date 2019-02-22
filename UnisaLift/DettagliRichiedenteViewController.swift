//
//  DettagliRichiedenteViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 22/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class DettagliRichiedenteViewController: UIViewController {

    var user : User!
    var application: Application!
    
    @IBOutlet weak var applicantImage: UIImageView!
    
    @IBAction func DenyRequestButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func AcceptRequestButtonPressed(_ sender: Any) {
        // dovrei cambiare il bottone, o disabilitare quest'ultimo
        // devo far comparire un messaggio di errore nel caso questo non accade
        if(application.offer!.freeSpots > 0) {
            application.state = 2
            application.offer!.freeSpots = application.offer!.freeSpots - 1
        }
    }
    
    @IBOutlet weak var applicantSurnameLabel: UILabel!
    
    @IBOutlet weak var applicantNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var profileimage = UIImage(data: user.imageFullRes as! Data, scale:1.0)
        applicantImage.image = profileimage
        applicantNameLabel.text = user.name
        applicantSurnameLabel.text = user.surname
        
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

}
