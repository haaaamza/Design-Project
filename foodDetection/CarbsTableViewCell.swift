//
//  CarbsTableViewCell.swift
//  foodDetection
//
//  Created by Hamza Mian on 2020-04-13.
//  Copyright © 2020 Qiang Xu. All rights reserved.
//

import UIKit

class CarbsTableViewCell: UITableViewCell {
    @IBOutlet weak var numCarb: UILabel!
    @IBOutlet weak var foodName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
