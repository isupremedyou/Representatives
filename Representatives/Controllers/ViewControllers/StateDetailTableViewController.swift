//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Travis Chapman on 10/18/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    var stateString: String?
    var representatives = [Representative]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let stateString = stateString else { return }
        RepresentativeController.fetchRepresentatives(forState: stateString) { (representatives) in
            self.representatives = representatives
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }

        cell.representative = representatives[indexPath.row]

        return cell
    }
}
