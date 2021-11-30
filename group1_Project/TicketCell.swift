//
//  TicketCell.swift
//  group1_Project
//
//  Created by Jagsifat Makkar on 2021-11-29.
//

import UIKit

class TicketCell: UITableViewCell {

    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityPricePerPerson: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var numOfTickets: UILabel!
    @IBOutlet weak var purchaserName: UILabel!
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
