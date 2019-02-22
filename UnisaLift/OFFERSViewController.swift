//
//  OFFERSViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 16/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class OFFERSViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var offers = [Offer]()
   
    
    
    
    // teoricamente non serve, da cancellare
    @IBAction func addOfferButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var OfferteSegment: UISegmentedControl!
    
    @IBAction func SegmentedControlAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        if(OfferteSegment.selectedSegmentIndex == 0) {
            offers = PersistenceManager.fetchOffers(userLogged: userLogged!)
        } else {
            offers = PersistenceManager.fetchUserOffers(offerer: userLogged!)
        }
        
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell=myTableView.dequeueReusableCell(withIdentifier: "OfferteCell", for: indexPath) as! OffertaTableViewCell
        
        let offer = offers[indexPath.row]
        
        mycell.OffertaNameLabel.text = offer.offerer?.name
        mycell.NumeroPostiLabel.text = String(offer.freeSpots)
        mycell.PartenzaLabel.text = offer.startPointDesc
        mycell.ArrivoLabel.text = offer.endPointDesc
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - hh:mm" // MM inserisce il mese come numero
        
        mycell.DateLabel.text = dateFormatter.string(from: offer.startDate as! Date)
        var profileimage = UIImage(data: offer.offerer?.imageFullRes! as! Data, scale:1.0)
        mycell.ImageOfferta.image = profileimage
        mycell.ImageOfferta.layer.borderWidth = 1
        mycell.ImageOfferta.layer.masksToBounds = false
        mycell.ImageOfferta.layer.borderColor = UIColor.black.cgColor
        mycell.ImageOfferta.layer.cornerRadius = mycell.ImageOfferta.layer.frame.height/2
        mycell.ImageOfferta.clipsToBounds = true
        mycell.layer.shadowColor = UIColor.lightGray.cgColor
        mycell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        mycell.layer.shadowRadius = 2.0
        mycell.layer.shadowOpacity = 1.0
        mycell.layer.masksToBounds = false
        mycell.layer.cornerRadius = 14
        mycell.layer.shadowPath = UIBezierPath(roundedRect: mycell.bounds, cornerRadius: mycell.contentView.layer.cornerRadius).cgPath
     
        return mycell
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    // dovrebbe non servire
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        super.viewDidLoad()
        
        offers = PersistenceManager.fetchOffers(userLogged: userLogged!)
        
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch (OfferteSegment.selectedSegmentIndex){
            
        case 0:
            
            performSegue(withIdentifier: "DettagliOfferta", sender: nil)
        case 1:
           performSegue(withIdentifier: "DettagliMiaOfferta", sender: nil)
        default:
            break
            
        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        if(OfferteSegment.selectedSegmentIndex == 0) {
            offers = PersistenceManager.fetchOffers(userLogged: userLogged!)
        } else {
            offers = PersistenceManager.fetchUserOffers(offerer: userLogged!)
        }

        myTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "DettagliOfferta":
            if let currentIndex = myTableView.indexPathForSelectedRow?.row {
                let offer = offers[currentIndex]
                // prendo la view di destinazione
                let destinationView = segue.destination as! DettagliOffertaViewController
                // trasferisco l'elemento all view di destinazione
                destinationView.offer = offer
            }
        case "DettagliMiaOfferta":
            if let currentIndex = myTableView.indexPathForSelectedRow?.row {
                let offer = offers[currentIndex]
                // prendo la view di destinazione
                let destinationView = segue.destination as! DettagliMiaOffertaViewController
                // trasferisco l'elemento all view di destinazione
                destinationView.offer = offer
            }
        default :
            return
        }
   
    }

}
