//
//  VenueDetailHeaderView.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 25.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit
import MapKit

class VenueDetailHeaderView: UITableViewHeaderFooterView {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var imageView: UIImageView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    func configure(with venue: Venue) {
        let location = CLLocation(latitude: venue.location.lat, longitude: venue.location.lng)
        mapView.centerToLocation(location)
        mapView.addAnnotation(latitude: venue.location.lat, longitude: venue.location.lng, title: venue.name)
        
        
        if let group = findVenuePhotos(with: venue), let items = group.items, items.indices.contains(0) {
            let url = items[0].prefix + String(describing: Int(imageView.frame.size.width)) + "x" + String(describing: Int(imageView.frame.size.height)) + items[0].suffix
            imageView.loadImage(with: url)
        }
    }

    func findVenuePhotos(with venue: Venue) -> Group! {
        let venuePhotosIndex = venue.photos.groups.firstIndex { (group) -> Bool in
            group.name  ==  "Venue photos"
        }

        if let index = venuePhotosIndex  {
           return venue.photos.groups[index]
        }
        
        return nil
    }
}
