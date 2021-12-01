//
//  FavoriteActivityCell.swift
//  group1_Project
//
//  Created by Jagsifat Makkar on 2021-11-29.
//

import Foundation
import UIKit

class FavoriteActivityCell : UITableViewCell{
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityPricePerPerson: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.75
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
