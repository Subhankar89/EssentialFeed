//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Subhankar Acharya on 07/04/2023.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
