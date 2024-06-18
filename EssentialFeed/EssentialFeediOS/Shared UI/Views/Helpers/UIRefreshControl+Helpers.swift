//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Subhankar  Acharya on 29/05/24.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
