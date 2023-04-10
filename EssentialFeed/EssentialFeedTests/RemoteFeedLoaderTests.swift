//
//  RemoteFeedLoader.swift
//  EssentialFeedTests
//
//  Created by Subhankar Acharya on 08/04/2023.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

// abstract class
protocol HTTPClient {
    func get(from url: URL)
}

// test logic moved into a test type which is the spy
class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
   func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestedDataFromURL() {
        
        let client = HTTPClientSpy()
        // create FeedLoader with a client
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
    
        let sut = RemoteFeedLoader(client: client)
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
}
