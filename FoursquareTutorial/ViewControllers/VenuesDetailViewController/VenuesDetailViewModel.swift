//
//  VenuesDetailViewModel.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

class VenuesDetailViewModel: NSObject {

    @IBOutlet var viewController: VenuesDetailViewController!
    @IBOutlet var tableView: UITableView!
    
    var venue: Venue!
    var tipItems: [Item]! {
        if let tips = venue.tips, let groups = tips.groups, groups.indices.contains(0) {
            return groups[0].items
        }

        return []
    }
    
    func configure() {
        tableView.register(UINib(nibName: String(describing: VenueDetailHeaderView.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: VenueDetailHeaderView.self))
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension VenuesDetailViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 350.0
    }
}

extension VenuesDetailViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipItems.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let venueDetailHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: VenueDetailHeaderView.self)) as! VenueDetailHeaderView
        venueDetailHeaderView.configure(with: venue)
        
        return venueDetailHeaderView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VenueDetailTableViewCell.self)) as! VenueDetailTableViewCell
        cell.configure(with: tipItems[indexPath.row])
        
        return cell
    }
}
