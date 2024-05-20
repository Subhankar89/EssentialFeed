//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Subhankar  Acharya on 20/05/24.
//

import UIKit

extension UIControl {
     func simulate(event: UIControl.Event) {
         allTargets.forEach { target in
             actions(forTarget: target, forControlEvent: event)?.forEach {
                 (target as NSObject).perform(Selector($0))
             }
         }
     }
 }
