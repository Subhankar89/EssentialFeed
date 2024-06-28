//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 28/06/24.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
        }
    }
}
