//
//  CustomTableViewCell.swift
//  DocUSignApp
//
//  Created by Zaid Alrakabi on 10/13/18.
//  Copyright © 2018 Zaid Alrakabi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
