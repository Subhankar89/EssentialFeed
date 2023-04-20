//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Subhankar Acharya on 20/04/2023.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
