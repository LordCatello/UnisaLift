//
//  OffertaTableViewCell.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 18/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class OffertaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ImageOfferta: UIImageView!
    @IBOutlet weak var OffertaNameLabel: UILabel!
    @IBOutlet weak var NumeroPostiLabel: UILabel!
    @IBOutlet weak var PartenzaLabel: UILabel!
    @IBOutlet weak var ArrivoLabel: UILabel!
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
