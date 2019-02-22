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
        // cancello sia se la richiesta è in corso, sia se è confermata
        // se l'application è confermata
        if(application.state == 2) {
            application.offer!.freeSpots = application.offer!.freeSpots + 1
        }
        PersistenceManager.deleteApplication(application: application)
    }
    
    @IBOutlet weak var acceptRequestButton: UIButton!
    @IBAction func AcceptRequestButtonPressed(_ sender: Any) {
        // devo far comparire un messaggio di errore nel caso questo non accade
        // bisogna disattivare il bottone quando l'offerta è confermata
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
        if(application.state == 2) {
            acceptRequestButton.isEnabled = false
            acceptRequestButton.isOpaque = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

}
