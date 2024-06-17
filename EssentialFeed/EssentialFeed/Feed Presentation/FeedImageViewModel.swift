//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 29/05/24.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
