//
//  DettagliOffertaViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 17/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MapKit

class DettagliOffertaViewController: UIViewController {
    
    var offer : Offer!
    
    @IBOutlet weak var nomePassaggio: UILabel!
    
    @IBOutlet weak var foto: UIImageView!
    
    @IBOutlet weak var postiRimasti: UILabel!
    
    @IBOutlet weak var partenza: UILabel!
    
    @IBOutlet weak var arrivo: UILabel!
    
    @IBOutlet weak var PartenzaLabel: UILabel!
    
    @IBAction func seeItineraryButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "Showmap", sender: nil)
    }
    
    @IBOutlet weak var messaggioAutista: UITextView!
    
    
    @IBAction func SendRequestButtonPressed(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        PersistenceManager.newApplication(offer: offer, applicant: userLogged!)
        performSegue(withIdentifier: "Richieste", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foto.layer.borderWidth = 1
        foto.layer.masksToBounds = false
        foto.layer.borderColor = UIColor.black.cgColor
        foto.layer.cornerRadius = foto.frame.height/2
        foto.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var postiRimastiLabel: UILabel!
    
    @IBOutlet weak var surnameOfferer: UILabel!
    @IBOutlet weak var nameOffererLabel: UILabel!
    @IBOutlet weak var ArrivoLabel: UILabel!
    @IBOutlet weak var orarioLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        
        PartenzaLabel.text = offer.startPointDesc
        ArrivoLabel.text = offer.endPointDesc
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - hh:mm" // MM inserisce il mese come numero
    orarioLabel.text = dateFormatter.string(from: offer.startDate as! Date)

        nameOffererLabel.text = offer.offerer?.name
        surnameOfferer.text = offer.offerer?.surname
        postiRimastiLabel.text = String(offer.freeSpots)
        var profileimage = UIImage(data: offer.offerer?.imageFullRes! as! Data, scale:1.0)
        foto.image = profileimage
        
        self.tabBarController?.tabBar.isHidden = true
        
        
        // CLLocation(latitude: peppe, longitude: swag)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "Showmap":
            let destinationView = segue.destination as! MapPathViewController
            destinationView.source = CLLocation(latitude: offer.startPointLat, longitude: offer.startPointLong)
            destinationView.destination = CLLocation(latitude: offer.endPointLat, longitude: offer.endPointLong)
        default:
            return
            
        }
        
    }
 

}
