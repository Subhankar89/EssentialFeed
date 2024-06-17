//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 29/05/24.
//

public struct ResourceErrorViewModel {
    public let message: String?

    static var noError: ResourceErrorViewModel {
        return ResourceErrorViewModel(message: nil)
    }

    static func error(message: String) -> ResourceErrorViewModel {
        return ResourceErrorViewModel(message: message)
    }
}
