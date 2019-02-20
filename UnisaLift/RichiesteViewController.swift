//
//  RichiesteViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 17/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class RichiesteViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell=myTableView.dequeueReusableCell(withIdentifier: "RichiesteCell", for: indexPath) as! RichiesteTableViewCell
        
        // mycell.textLabel?.text=DataSource[indexPath.row]
        
        
        switch (RichiesteSegmentedControl.selectedSegmentIndex){
            
        case 0:
            mycell.RichiesteNomeLabel.text = "Luca"
            mycell.RichiesteNumeroPostiLabel.text = "4 posti rimanenti"
            mycell.RichiestePartenzaLabel.text = "7:55 Salerno"
            mycell.RichiesteArrivoLabel.text = "Fisciano"
            mycell.RichiesteImageCell.image = nil
        case 1:
            mycell.RichiesteNomeLabel.text = "Luca"
            mycell.RichiesteNumeroPostiLabel.text = "prova"
            mycell.RichiestePartenzaLabel.text = nil
            mycell.RichiesteArrivoLabel.text = nil
            mycell.RichiesteImageCell.image = nil
    default:
            break
            
        }
        
        
        
        return mycell
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var RichiesteSegmentedControl: UISegmentedControl!
    
    @IBAction func RichiesteSegmentedControlAction(_ sender: Any) {
        myTableView.reloadData()
    }
    var DataSource = ["Prova1","prova2","Prova3"]
    var RichiesteAccettate = ["Salerno","Fisciano"]
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch (RichiesteSegmentedControl.selectedSegmentIndex){
            
        case 0:
            return DataSource.count
        case 1:
            return RichiesteAccettate.count
        default:
            return 0;
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
    
    
    
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
        

    
    

        
        // Do any additional setup after loading the view.
    }

}
