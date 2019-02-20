//
//  DettagliOffertaViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 17/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class DettagliOffertaViewController: UIViewController {
    
    
    @IBOutlet weak var nomePassaggio: UILabel!
    
    @IBOutlet weak var foto: UIImageView!
    
    @IBOutlet weak var postiRimasti: UILabel!
    
    @IBOutlet weak var partenza: UILabel!
    
    @IBOutlet weak var arrivo: UILabel!
    
    @IBOutlet weak var itineraryButton: UIButton!
    
    @IBOutlet weak var messaggioAutista: UITextView!
    
    @IBOutlet weak var requestButton: UIButton!
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
