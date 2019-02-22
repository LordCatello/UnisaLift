//
//  DettagliRichiesteViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 21/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class DettagliRichiesteViewController: UIViewController {
    var application : Application!

    @IBAction func deleteApplicationButtonPressed(_ sender: Any) {
        
        if(application.state == 2) {
            application.offer!.freeSpots = application.offer!.freeSpots + 1
        }
        PersistenceManager.deleteApplication(application: application)
        
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

}
