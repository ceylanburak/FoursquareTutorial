//
//  Location.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation

class Location: Codable {
    var address: String!
    var lat: Double!
    var lng: Double!
    var labeledLatLngs: [LabeledLatLngs]!
    var cc: String!
    var city: String!
    var state: String!
    var country: String!
    var formattedAddress: [String]!
}
