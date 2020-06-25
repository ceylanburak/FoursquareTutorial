//
//  VenuesSearchParameters.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation

class VenuesSearchParameters: Codable {
    var ll: String!
    var near: String!
    var radius: String!
    var query: String!
    var limit: String!
    var categoryId: String!
    var llAcc: String!
    var alt: String!
    var altAcc: String!
    var url: String!
    var providerId: String!
    var linkedId: String!
}
