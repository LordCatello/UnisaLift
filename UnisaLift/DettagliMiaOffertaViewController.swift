//
//  DettagliMiaOffertaViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MapKit

class DettagliMiaOffertaViewController: UIViewController {

    var offer : Offer!
    
    @IBOutlet weak var deleteOfferButton: UIButton!
    
    @IBOutlet weak var postiRimasti: UILabel!
    
    @IBOutlet weak var arrivo: UILabel!
    @IBOutlet weak var partenza: UILabel!
    @IBOutlet weak var message: UITextView!
    
    @IBAction func seeItineraryButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "Showmap2", sender: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Showmap2":
            let destinationView = segue.destination as! MapPathViewController
            destinationView.source = CLLocation(latitude: offer.startPointLat, longitude: offer.startPointLong)
            destinationView.destination = CLLocation(latitude: offer.endPointLat, longitude: offer.endPointLong)
        default:
            return
        }
    }

}
