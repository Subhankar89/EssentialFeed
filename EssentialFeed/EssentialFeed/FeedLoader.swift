//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Subhankar Acharya on 07/04/2023.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
