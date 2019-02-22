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
    
    @IBAction func acceptApplicationButton(_ sender: Any) {
        // per adesso cambio solo lo stato
        // dovrei cambiare il bottone, o disabilitare quest'ultimo
        // aggiornare il numero di posti liberi
        // gestire il fatto che se non ci sono più posti liberi, l'offerta scompare dalla liste delle offerte nella lobby
        /*let currentIndex = OfferApplicationTableView.indexPathForSelectedRow?.row
        
        let application = applications[currentIndex!]
        
        application.state = 2*/
        //performSegue(withIdentifier: "DettagliRichiedente", sender: nil)
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
        partenzaLabel.text = offer.startPointDesc
        arrivoLabel.text = offer.endPointDesc
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - hh:mm" // MM inserisce il mese come numero
       dateLabel.text = dateFormatter.string(from: offer.startDate as! Date)
        
        
        freespotsLabel.text = String(offer.freeSpots)
    
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
