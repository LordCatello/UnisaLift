//
//  DettagliRichiesteViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 21/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit
import MapKit

class DettagliRichiesteViewController: UIViewController {
    var application : Application!
    
    @IBOutlet weak var liftStartedLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var arrivoLabel: UILabel!
    @IBOutlet weak var partenzaLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBAction func deleteApplicationButtonPressed(_ sender: Any) {
        
        if(application.state == 2) {
            application.offer!.freeSpots = application.offer!.freeSpots + 1
        }
        PersistenceManager.deleteApplication(application: application)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        
        if(application.offer!.state != 2) {
            liftStartedLabel.isHidden = true
        }
        
        if(application.offer!.state == 2) {
            deleteButton.isHidden = true
            liftStartedLabel.isHidden = false
        }
        
            }
    
    
    
    @IBAction func seeItineraryButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "Showmap3", sender: nil)
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        partenzaLabel.text = application.offer?.startPointDesc
        nameLabel.text = application.offer?.offerer?.name
        surnameLabel.text = application.offer?.offerer?.surname
        seatsLabel.text = String(application.offer!.freeSpots)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - hh:mm" // MM inserisce il mese come numero
        dateLabel.text = dateFormatter.string(from: application.offer?.startDate as! Date)
        arrivoLabel.text = application.offer?.endPointDesc
        var profileimage = UIImage(data: application.offer?.offerer?.imageFullRes! as! Data, scale:1.0)
    
        image.image = profileimage
        
        if(application.offer!.state != 2) {
            liftStartedLabel.isHidden = true
        }
        
        if(application.offer!.state == 2) {
            deleteButton.isHidden = true
            liftStartedLabel.isHidden = false
        }
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "Showmap3":
            let destinationView = segue.destination as! MapPathViewController

            
        destinationView.source = CLLocation(latitude: application.offer!.startPointLat, longitude: application.offer!.startPointLong)
            
            destinationView.destination = CLLocation(latitude: application.offer!.endPointLat, longitude: application.offer!.endPointLong)
        default:
            return
            
        }

}
}
