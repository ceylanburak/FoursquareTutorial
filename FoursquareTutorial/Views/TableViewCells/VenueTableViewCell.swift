//
//  VenueTableViewCell.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell {

    @IBOutlet var venueTitleLabel: UILabel!
    @IBOutlet var venueAddressLabel: UILabel!
    @IBOutlet var venueCityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func confugure(with venue: Venue){
        venueTitleLabel.text = venue.name
        venueAddressLabel.text = venue.location.formattedAddress.indices.contains(0) ? venue.location.formattedAddress[0] : ""
        venueCityLabel.text = venue.location.formattedAddress.indices.contains(1) ? venue.location.formattedAddress[1] : ""

    }
}
