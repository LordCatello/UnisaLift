//
//  DettagliMiaOffertaViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 20/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MapKit

class DettagliMiaOffertaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = OfferApplicationTableView.dequeueReusableCell(withIdentifier: "RichiestaPerOffertaCell", for: indexPath) as! RichiestaperOffertaTableViewCell
        
        let application = applications[indexPath.row]
        
        
        mycell.nameLabel.text = application.applicant?.name
        mycell.surnameLabel.text = application.applicant?.surname
        var profileimage = UIImage(data: application.applicant?.imageFullRes as! Data, scale:1.0)
        mycell.Profile.image = profileimage
        
        
        
        return mycell
        
        
    }
    
    
    var applications = [Application]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applications.count
    }

    var offer : Offer!
    
    @IBOutlet weak var deleteOfferButton: UIButton!
    
    @IBOutlet weak var OfferApplicationTableView: UITableView!
    
    
    @IBOutlet weak var postiRimasti: UILabel!
    
    @IBOutlet weak var arrivo: UILabel!
    @IBOutlet weak var partenza: UILabel!
    @IBOutlet weak var message: UITextView!
    
    @IBAction func seeItineraryButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "Showmap2", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applications = PersistenceManager.fetchOfferApplications(offer: offer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
        applications = PersistenceManager.fetchOfferApplications(offer: offer)
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
