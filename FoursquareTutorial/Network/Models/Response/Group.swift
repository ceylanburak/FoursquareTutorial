//
//  Group.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation

class Group: Codable {
    var type: String!
    var name: String!
    var count: Int!
    var items: [Item]!
}
