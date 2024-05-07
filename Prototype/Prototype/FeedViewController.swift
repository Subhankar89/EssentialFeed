//
//  FeedViewController.swift
//  Prototype
//
//  Created by Subhankar  Acharya on 07/05/24.
//

import UIKit

final class FeedViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "FeedImageCell")!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
}
