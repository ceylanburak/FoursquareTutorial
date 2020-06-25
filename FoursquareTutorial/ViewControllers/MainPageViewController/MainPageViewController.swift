//
//  MainPageViewController.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit
import CoreLocation

class MainPageViewController: UIViewController {
    @IBOutlet var viewModel: MainPageViewModel!
    
    var currentLocation: CLLocation!
    var locationManager = CLLocationManager()
    let segueIdentifier = "showVenuesViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Main Page" 
        viewModel.configure()
        initLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    func initLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getLocation() -> String! {
        if let location = locationManager.location, (CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
            
            currentLocation = location
            return String(currentLocation.coordinate.latitude) + "," + String(currentLocation.coordinate.longitude)
        }
        
        return nil
    }
    
    func requestForSearchVenues(with parameters: VenuesSearchParameters) {
        NetworkManager.request(with: Constants.URLs.Venues.search, parameters: parameters.dictionary as? [String: String], responseType: VenuesSearchResponse.self, successCompletion: { [weak self] (response) in
            
            guard let self = self else {return}
            guard let response = response?.response else {return}
            self.performSegue(withIdentifier: self.segueIdentifier, sender: response.venues)
        })
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let destination = segue.destination as! VenuesViewController
            if let venues = sender as? [Venue] {
                destination.venues = venues
            }
        }
    }
    

}

extension MainPageViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
