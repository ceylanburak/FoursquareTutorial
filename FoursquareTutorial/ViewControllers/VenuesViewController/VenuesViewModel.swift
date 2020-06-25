//
//  PlacesViewModel.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

class VenuesViewModel: NSObject {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var viewController: VenuesViewController!
    
    var venues: [Venue]!
        
    func configure() {
        self.tableView.estimatedRowHeight = 103.0
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}

extension VenuesViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let id = venues[indexPath.row].id {
            viewController.requestForSearchVenueDetail(with: id)
        }
    }
}

extension VenuesViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VenueTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: VenueTableViewCell.self)) as! VenueTableViewCell
        cell.confugure(with: venues[indexPath.row])
        
        return cell
    }
    
    
}
