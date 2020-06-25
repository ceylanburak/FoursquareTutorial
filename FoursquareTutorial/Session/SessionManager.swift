//
//  SessionManager.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import Foundation
import FoursquareAPIClient

class SessionManager {
    static let shared = SessionManager()
    let client = FoursquareAPIClient(clientId: Constants.FoursquareClient.id, clientSecret: Constants.FoursquareClient.secret)
    
    private init() {}
}
