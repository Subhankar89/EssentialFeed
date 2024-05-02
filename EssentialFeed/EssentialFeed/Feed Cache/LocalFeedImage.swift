//
//  LocalFeedImage.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 15/04/24.
//

import Foundation

// FeedImage representation for the Cache Module
public struct LocalFeedImage: Equatable, Codable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let url: URL
    
    public init(id: UUID,
                description: String?,
                location: String?,
                url: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
}
