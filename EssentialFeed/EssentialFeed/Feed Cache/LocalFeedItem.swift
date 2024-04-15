//
//  LocalFeedItem.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 15/04/24.
//

import Foundation

// FeedItem representation for the Cache Module
public struct LocalFeedItem: Equatable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
    
    public init(id: UUID,
                description: String?,
                location: String?,
                imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
