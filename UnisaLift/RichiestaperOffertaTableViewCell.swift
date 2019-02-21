//
//  RichiestaperOffertaTableViewCell.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 21/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class RichiestaperOffertaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Profileimage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func acceptApplicationButtonPerformed(_ sender: Any) {
        
    }
    
    @IBOutlet weak var surnameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
