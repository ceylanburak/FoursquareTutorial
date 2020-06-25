//
//  Button+Extension.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

extension UIButton {
    func changeState(isEnabled: Bool) {
        self.alpha = isEnabled ? 1.0 : 0.5
        self.isUserInteractionEnabled = isEnabled
    }
}
