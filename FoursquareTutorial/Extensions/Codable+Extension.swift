//
//  Codable+Extension.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]! {
      guard let data = try? JSONEncoder().encode(self) else { return nil }
        if let dictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap({ $0 as? [String: Any] }) {
            
            return dictionary
        }
        
        return nil
    }
}
