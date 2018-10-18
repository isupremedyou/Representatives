//
//  Representative.swift
//  Representatives
//
//  Created by Travis Chapman on 10/18/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import Foundation

struct Representative: Codable {
    
    let name: String
    let party: String
    let state: String
    let district: Int
    let phone: String
    let officeAddress: String
    let webURLAsString: String
    
    enum CodingKeys: String, CodingKey {
        case webURLAsString = "link"
        case officeAddress = "office"
        case name
        case party
        case state
        case district
        case phone
    }
}


