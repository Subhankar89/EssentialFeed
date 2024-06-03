//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 03/06/24.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
