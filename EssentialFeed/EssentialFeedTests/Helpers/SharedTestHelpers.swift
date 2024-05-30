//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Subhankar  Acharya on 30/04/24.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
     return Data("any data".utf8)
 }
