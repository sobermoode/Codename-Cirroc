//
//  ModeCell.swift
//  CaribooInitialTest
//
//  Created by Aaron Justman on 8/8/17.
//  Copyright © 2017 Aaron Justman. All rights reserved.
//

import UIKit

class ModeCell: UITableViewCell {

    @IBOutlet weak var modeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        contentView.backgroundColor = UIColor(red: 1, green: 147/255, blue: 0, alpha: 1)
    }
    
}
