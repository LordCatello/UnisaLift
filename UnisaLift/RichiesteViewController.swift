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
        var profileimage = UIImage(data: application.offer!.offerer?.imageFullRes! as! Data, scale:1.0)
        mycell.RichiesteImageCell.image = profileimage
        mycell.RichiesteImageCell.layer.borderWidth = 1
        mycell.RichiesteImageCell.layer.masksToBounds = false
        mycell.RichiesteImageCell.layer.borderColor = UIColor.black.cgColor
        mycell.RichiesteImageCell.layer.cornerRadius = mycell.RichiesteImageCell.layer.frame.height/2
        mycell.RichiesteImageCell.clipsToBounds = true
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
