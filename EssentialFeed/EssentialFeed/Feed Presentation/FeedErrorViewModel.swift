//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 29/05/24.
//

public struct FeedErrorViewModel {
    public let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
