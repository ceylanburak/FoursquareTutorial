//
//  Categories.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation

class Category: Codable {
    var id: String!
    var name: String!
    var pluralName: String!
    var shortName: String!
    var icon: Icon!
    var primary: Bool!
}
