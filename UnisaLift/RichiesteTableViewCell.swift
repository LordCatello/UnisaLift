//
//  RichiesteTableViewCell.swift
//  UnisaLift
//
//  Created by Cuomo Luca on 19/02/2019.
//  Copyright © 2019 RottenApples. All rights reserved.
//

import UIKit

class RichiesteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var RichiesteNomeLabel: UILabel!
    
    @IBOutlet weak var RichiesteArrivoLabel: UILabel!
    @IBOutlet weak var RichiestePartenzaLabel: UILabel!
    @IBOutlet weak var RichiesteNumeroPostiLabel: UILabel!
    @IBOutlet weak var RichiesteImageCell: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
