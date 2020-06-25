//
//  VenuesDetailViewController.swift
//  FoursquareTutorial
//
//  Created by Burak Ceylan on 24.06.2020.
//  Copyright © 2020 Burak Ceylan. All rights reserved.
//

import UIKit

class VenuesDetailViewController: UIViewController {

    @IBOutlet var viewModel: VenuesDetailViewModel!
    var venue: Venue!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.configure()
        viewModel.venue = venue
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
