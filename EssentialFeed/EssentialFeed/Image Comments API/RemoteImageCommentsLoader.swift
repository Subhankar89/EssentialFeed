//
//  RemoteImageCommentsLoaderClass.swift
//  EssentialFeed
//
//  Created by Subhankar  Acharya on 09/06/24.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
