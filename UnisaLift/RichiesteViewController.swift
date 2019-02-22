//
//  RichiesteViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 17/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class RichiesteViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    var applications = [Application]()
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell=myTableView.dequeueReusableCell(withIdentifier: "RichiesteCell", for: indexPath) as! RichiesteTableViewCell

        let application = applications[indexPath.row]
        
        mycell.RichiesteNomeLabel.text = application.offer?.offerer?.name
        mycell.RichiestePartenzaLabel.text = application.offer?.startPointDesc
        mycell.RichiesteArrivoLabel.text = application.offer?.endPointDesc
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - hh:mm" // MM inserisce il mese come numero
        
        mycell.dateLabel.text = dateFormatter.string(from: application.offer?.startDate as! Date)
        
        var profileimage = UIImage(data: application.offer!.offerer?.imageFullRes! as! Data, scale:1.0)
        mycell.RichiesteImageCell.image = profileimage
        
        return mycell
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var RichiesteSegmentedControl: UISegmentedControl!
    
    @IBAction func RichiesteSegmentedControlAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        if(RichiesteSegmentedControl.selectedSegmentIndex == 0) {
            applications = PersistenceManager.fetchActiveApplications(applicant: userLogged!)
        } else {
            applications = PersistenceManager.fetchConfirmedApplications(applicant: userLogged!)
        }
        
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applications.count
    }
    
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        super.viewDidLoad()
        
        applications = PersistenceManager.fetchActiveApplications(applicant: userLogged!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userLogged = appDelegate.userLogged
        
        if(RichiesteSegmentedControl.selectedSegmentIndex == 0) {
            applications = PersistenceManager.fetchActiveApplications(applicant: userLogged!)
        } else {
            applications = PersistenceManager.fetchConfirmedApplications(applicant: userLogged!)
        }
        
        myTableView.reloadData()
    }

}
