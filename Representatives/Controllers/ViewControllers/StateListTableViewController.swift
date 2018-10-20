//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Travis Chapman on 10/18/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    // MARK: - Constants & Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

        cell.textLabel?.text = States.all[indexPath.row]

        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toStateDetailVC" {
            
            guard let destinationVC = segue.destination as? StateDetailTableViewController,
                let index = tableView.indexPathForSelectedRow?.row
                else { return }
            
            destinationVC.stateString = States.all[index]
        }
    }
}
