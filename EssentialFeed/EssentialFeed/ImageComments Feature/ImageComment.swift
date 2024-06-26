//
//  ImageComment.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 09/06/24.
//

import Foundation

// app specific data model
public struct ImageComment: Equatable {
  
    public let id: UUID
    public let message: String
    public let createdAt: Date
    public let username: String
    
    public init(id: UUID, message: String, createdAt: Date, username: String) {
        self.id = id
        self.message = message
        self.createdAt = createdAt
        self.username = username
    }
}
