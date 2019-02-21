//
//  ImpostazioniViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 18/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class ImpostazioniViewController: UIViewController {

  
    @IBAction func logoutButtonPressed(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.userLogged = nil
        performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var car: UILabel!
    @IBOutlet weak var descrizione: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
