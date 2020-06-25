//
//  MainPageViewModel.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

class MainPageViewModel: NSObject {
    @IBOutlet var venueTypeTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet weak var viewController: MainPageViewController!

    
    func configure() {
        searchButton.changeState(isEnabled: false)
    }
       
    func requestByLatitudeAndLongitude() {
        guard let ll = viewController.getLocation() else {return}
        
        let venuesSearchRequestModel = VenuesSearchParameters()
        venuesSearchRequestModel.ll = ll
        venuesSearchRequestModel.query = venueTypeTextField.text!
        viewController.requestForSearchVenues(with: venuesSearchRequestModel)
    }
    
    func requestByLocationName() {
        let venuesSearchRequestModel = VenuesSearchParameters()
        venuesSearchRequestModel.near = locationTextField.text!
        venuesSearchRequestModel.query = venueTypeTextField.text!
        viewController.requestForSearchVenues(with: venuesSearchRequestModel)
    }
    
    @IBAction func searchButtonAction(sender: AnyObject) {
        if locationTextField.text!.isEmpty {
            requestByLatitudeAndLongitude()

        }else {
            requestByLocationName()
        }
    }
}

extension MainPageViewModel: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // only letters for both textfields
        
        let characterSet = CharacterSet.letters
        if let _ = string.rangeOfCharacter(from: characterSet.inverted) {
            return false
        }
        
        if textField == venueTypeTextField {
            let currentString = textField.text! as NSString
            let newString = currentString.replacingCharacters(in: range, with: string)
            searchButton.changeState(isEnabled: newString.count > 2)
        }
        
        return true
    }
}
