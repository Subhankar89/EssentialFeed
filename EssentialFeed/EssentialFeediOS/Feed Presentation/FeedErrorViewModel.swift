//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Subhankar  Acharya on 29/05/24.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
