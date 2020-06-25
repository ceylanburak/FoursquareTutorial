//
//  Data+Extension.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation

extension Data {
    var prettyJSON: String! {
        get {
            return String(data: self, encoding: .utf8)!
        }
    }
}
