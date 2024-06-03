//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Subhankar  Acharya on 03/06/24.
//

import EssentialFeed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
