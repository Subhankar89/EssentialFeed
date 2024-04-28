//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 15/04/24.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}