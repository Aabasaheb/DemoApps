//
//  FirstDescriptionTableViewCell.swift
//  TelstraListView
//
//  Created by Aabasaheb Deshpande on 1/30/19.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import UIKit

class FirstDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
