//
//  PlacesViewController.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

class VenuesViewController: UIViewController {

    @IBOutlet var viewModel: VenuesViewModel!
    var venues: [Venue]!
    
    let segueIdentifier = "showVenuesDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Places"
        viewModel.venues = venues
        viewModel.configure()
    }
    
    func requestForSearchVenueDetail(with venueId: String) {
        NetworkManager.request(with: Constants.URLs.Venues.details + venueId, responseType: VenueDetailResponse.self, successCompletion: { [weak self] (response) in
            
            guard let self = self else {return}
            guard let response = response?.response else {return}
            self.performSegue(withIdentifier: self.segueIdentifier, sender: response.venue)
            
        })
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let destination = segue.destination as! VenuesDetailViewController
            
            if let venue = sender as? Venue {
                destination.venue = venue
            }
        }
    }
}
