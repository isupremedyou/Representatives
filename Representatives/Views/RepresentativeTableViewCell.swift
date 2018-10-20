//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Travis Chapman on 10/18/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    var representative: Representative? {
        didSet {
            self.representativeNameLabel.text = representative?.name
            self.partyLabel.text = representative?.party
            self.websiteLabel.text = representative?.webURLAsString
            self.phoneLabel.text = representative?.phone
            self.stateLabel.text = representative?.state
            self.districtLabel.text = representative?.district
            self.addressLabel.text = representative?.officeAddress
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var representativeNameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
}
