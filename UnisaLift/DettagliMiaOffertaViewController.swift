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
    
    @IBOutlet weak var deleteOfferButton: UIButton!
    
    @IBOutlet weak var StartLiftButton: UIButton!
    
    @IBAction func acceptApplicationButton(_ sender: Any) {

    }
    
    @IBAction func StartLiftButtonPressed(_ sender: Any) {
        // devo fare in modo che le richieste confermate non siano più cancellabili
        // devo cancellare tutte le richieste non confermate
        if(offer.state != 2) {
            offer.state = 2
            StartLiftButton.setTitle("Finish Lift", for: .normal)
            deleteOfferButton.isHidden = true
        }
        
        // cancello la richiesta se premo su Finish Lift
        if(offer.state == 2) {
            PersistenceManager.deleteOffer(offer: offer)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "DettagliRichiedente", sender: nil)
        
    }
    
    @IBOutlet weak var arrivoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var partenzaLabel: UILabel!
    @IBOutlet weak var freespotsLabel: UILabel!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = OfferApplicationTableView.dequeueReusableCell(withIdentifier: "RichiestaPerOffertaCell", for: indexPath) as! RichiestaperOffertaTableViewCell
        
        let application = applications[indexPath.row]
        
        mycell.nameLabel.text = application.applicant?.name
        mycell.surnameLabel.text = application.applicant?.surname
        var profileimage = UIImage(data: application.applicant?.imageFullRes as! Data, scale:1.0)
        mycell.Profile.image = profileimage
        mycell.Profile.layer.borderWidth = 1
        mycell.Profile.layer.masksToBounds = false
        mycell.Profile.layer.borderColor = UIColor.black.cgColor
        mycell.Profile.layer.cornerRadius = mycell.Profile.frame.height/2
        mycell.Profile.clipsToBounds = true
        mycell.layer.shadowColor = UIColor.lightGray.cgColor
        mycell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        mycell.layer.shadowRadius = 2.0
        mycell.layer.shadowOpacity = 1.0
        mycell.layer.masksToBounds = false
        mycell.layer.cornerRadius = 14
        mycell.layer.shadowPath = UIBezierPath(roundedRect: mycell.bounds, cornerRadius: mycell.contentView.layer.cornerRadius).cgPath
        return mycell
    }
    
    var applications = [Application]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applications.count
    }

    var offer : Offer!
    
    @IBAction func deleteOfferButton(_ sender: Any) {
        // deleteOffer cancella anche tutte le applications associate alle offerte
        PersistenceManager.deleteOffer(offer: offer)
        self.navigationController?.popViewController(animated: true)
    }
    
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
        
        if(offer.state == 2) {
            StartLiftButton.setTitle("Finish Lift", for: .normal)
            deleteOfferButton.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        partenzaLabel.text = offer.startPointDesc
        arrivoLabel.text = offer.endPointDesc
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - hh:mm" // MM inserisce il mese come numero
        dateLabel.text = dateFormatter.string(from: offer.startDate as! Date)
        
        freespotsLabel.text = String(offer.freeSpots)
    
        self.tabBarController?.tabBar.isHidden = true
        
        applications = PersistenceManager.fetchOfferApplications(offer: offer)
        
        OfferApplicationTableView.reloadData()
        
        if(offer.state == 2) {
            StartLiftButton.setTitle("Finish Lift", for: .normal)
            deleteOfferButton.isHidden = true
        }
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
        case "DettagliRichiedente":
            
            let destinationView = segue.destination as! DettagliRichiedenteViewController
            
            let currentIndex = OfferApplicationTableView.indexPathForSelectedRow?.row
            
            let application = applications[currentIndex!]
            destinationView.user = application.applicant
            
            destinationView.application = application
            
            
        default:
            return
        }
    }

}
