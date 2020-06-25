//
//  Venue.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation

class Venue: Codable {
    var id :String!
    var name: String!
    var contact: Contact!
    var location: Location!
    var canonicalUrl: String!
    var categories: [Category]!
    var verified: Bool!
    var stats: Stats!
    var url: String!
    var beenHere: BeenHere!
    var description: String!
    var hereNow: HereNow!
    var referralId: String!
    var hasPerk: Bool!
    var tips: Tips!
    var photos: Photos!
}
