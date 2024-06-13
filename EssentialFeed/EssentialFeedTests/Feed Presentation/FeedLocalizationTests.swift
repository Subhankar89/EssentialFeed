//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by Subhankar  Acharya on 23/05/24.
//

import XCTest
import EssentialFeed

final class FeedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
