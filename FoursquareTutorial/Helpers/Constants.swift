//
//  Constants.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

struct Constants {
    static let imageCache = NSCache<NSString, UIImage>()

    struct URLs {
        struct Venues {
            private static let root = "venues/"
            static let search = root + "search"
            static let details = root
            static let photo = "https://api.foursquare.com/v2/venues/"
        }
    }
    
    struct FoursquareClient {
        static let id = "TIG3PPDM0EX4KNEJQKG5BANVGTBWFXPW5QWHGHH2ZTOANDCQ"
        static let secret = "EQNO1PQKJOG3LBYNCK2V0W0NQRK2Y24WUWGFNUXVBMRVNTZG"
    }
    
    struct LocationManager {
        static let distanceFilter: Double = 50
        static let distanceSpan: Double = 500
    }
}
