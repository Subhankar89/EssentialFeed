//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 15/04/24.
//

import Foundation

 struct RemoteFeedItem: Decodable {
     let id: UUID
     let description: String?
     let location: String?
     let image: URL
}
