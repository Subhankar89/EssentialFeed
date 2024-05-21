//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Subhankar  Acharya on 20/05/24.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
