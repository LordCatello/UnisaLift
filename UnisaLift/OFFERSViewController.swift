//
//  OFFERSViewController.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 16/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class OFFERSViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var DataSource = ["Prova1","prova2","Prova3"]
    var mieOfferte = ["Salerno","Fisciano"]
    
    @IBOutlet weak var OfferteSegment: UISegmentedControl!
    
    
    @IBAction func SegmentedControlAction(_ sender: Any) {
        
        myTableView.reloadData()
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch (OfferteSegment.selectedSegmentIndex){
            
        case 0:
            return DataSource.count
        case 1:
            return mieOfferte.count
        default:
            return 0;
            
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell=myTableView.dequeueReusableCell(withIdentifier: "OfferteCell", for: indexPath) as! OffertaTableViewCell
        
       // mycell.textLabel?.text=DataSource[indexPath.row]
        
        
        switch (OfferteSegment.selectedSegmentIndex){
            
        case 0:
            mycell.OffertaNameLabel.text = "Luca"
            mycell.NumeroPostiLabel.text = "4 posti rimanenti"
            mycell.PartenzaLabel.text = "7:55 Salerno"
            mycell.ArrivoLabel.text = "Fisciano"
            mycell.ImageOfferta.image = #imageLiteral(resourceName: "ImagineProva.jpg")
        case 1:
            mycell.textLabel!.text = mieOfferte[indexPath.row]
        default:
          break
            
        }
        
        
        
        return mycell
        
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.rowHeight = UITableView.automaticDimension;
        myTableView.estimatedRowHeight = 200.0;
        
        
        // Do any additional setup after loading the view, typically from a nib.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    var OfferteStore = ["Ciao"]
    
    @IBOutlet weak var mytableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mytableView.delegate = self
        mytableView.dataSource = self
        
        
        
        OfferteStore.append("Prova")
        OfferteStore.append("Carminegay")
        mytableView.reloadData()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return OfferteStore.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mytableView.dequeueReusableCell(withIdentifier: "OfferteCell", for: indexPath)
        
        
        //cell.textLabel?.text = "prova"
        
        print("hello")
        
        // Configure the cell...
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mytableView.reloadData()
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

*/
