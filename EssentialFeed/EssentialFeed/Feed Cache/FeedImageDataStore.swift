//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 31/05/24.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
