//
//  XCTTestCase+MemoeryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Subhankar Acharya on 04/06/2023.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}

