//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 29/05/24.
//

import Foundation

public final class FeedImagePresenter {
    
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
