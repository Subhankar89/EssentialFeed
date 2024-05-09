//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Subhankar  Acharya on 08/04/24.
//

import XCTest
import EssentialFeed

final class CacheFeedUseCaseTests: XCTestCase {
     
    // Does Not delete the cached upon creation
    func test_init_doesNotMessageStoreUponCreation() {
        
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    // calling the save command
    func test_save_requestsCacheDeletion() {
        
        let (sut, store) = makeSUT()
        
        sut.save(uniqueImageFeed().models) { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed])
    }
    
    // deleting something if they fail
    func test_save_doesNotRequestCacheInsertionOnDeletionError() {
        
  let (sut, store) = makeSUT()
        let deletionError = anyNSError()
        
        sut.save(uniqueImageFeed().models) { _ in }
        store.completeDeletion(with: deletionError)
        
        XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed])
    }

    // timestamp on cache insertion
    func test_save_requestsNewCacheInsertionWithTimestampOnSuccessfulDeletion() {
        let timeStamp = Date()
        let feed = uniqueImageFeed()
        let (sut, store) = makeSUT(currentDate: { timeStamp })
        
        // save feed items
        sut.save(feed.models) { _ in }
        store.completeDeletionSuccessfully()
        
        // store to insert local representation of feed items
        XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed, .insert(feed.local, timeStamp)])
    }
    
    // deliver deletion error to save method's client
    func test_save_failsOnDeletionError() {
        
        let (sut, store) = makeSUT()
        let deletionError = anyNSError()
        
        expect(sut, toCompleteWithError: deletionError, when: {
            store.completeDeletion(with: deletionError)
        })
    }
    
    // fails on insertion
    func test_save_failsOnInsertionError() {
        
        let (sut, store) = makeSUT()
        let insertionError = anyNSError()
        
        expect(sut, toCompleteWithError: insertionError, when: {
            store.completeDeletionSuccessfully()
            store.completeInsertion(with: insertionError)
        })
    }
    
    // successful insertion
    func test_save_succeedsOnSuccessfulCacheInsertion() {
        
        let (sut, store) = makeSUT()
        
        expect(sut, toCompleteWithError: nil, when: {
            store.completeDeletionSuccessfully()
            store.completeInsertionSuccessfully()
        })
    }
    
    // handle the unwowned self
    func test_doesNotDeliverDeletionErrorAfterSUTInstanceHasBeenDeallocated() {
        let store =  FeedStoreSpy()
        var sut: LocalFeedLoader? = LocalFeedLoader(store: store, currentDate: Date.init)
        
        var receivedResults = [LocalFeedLoader.SaveResult]()
        
        // we dont want this completion to be invoked after the instance has been deallocated
        sut?.save(uniqueImageFeed().models) { receivedResults.append($0) }
        sut = nil
        store.completeDeletion(with: anyNSError())
        
        XCTAssertTrue(receivedResults.isEmpty)
    }
    
    // for the insertion completion
    func test_doesNotDeliverInsertionErrorAfterSUTInstanceHasBeenDeallocated() {
        let store =  FeedStoreSpy()
        var sut: LocalFeedLoader? = LocalFeedLoader(store: store, currentDate: Date.init)
        
        var receivedResults = [LocalFeedLoader.SaveResult]()
        
        // we dont want this completion to be invoked after the instance has been deallocated
        sut?.save(uniqueImageFeed().models) { receivedResults.append($0) }
        store.completeDeletionSuccessfully()
        sut = nil
        store.completeInsertion(with: anyNSError())
        
        XCTAssertTrue(receivedResults.isEmpty)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath,
                         line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return (sut, store)
    }

    private func expect(_ sut: LocalFeedLoader, 
                        toCompleteWithError expectedError: NSError?,
                        when action: () -> Void,
                        file: StaticString = #filePath,
                        line: UInt = #line) {
        let exp = expectation(description: "Wait for save comletion")
        var receivedError: Error?
        
        // pass a block as operation is asynchronous
        sut.save(uniqueImageFeed().models) { result in
            if case let Result.failure(error) = result { receivedError = error }
            exp.fulfill()
        }
        action()
        wait(for: [exp], timeout: 1.0)
        
        XCTAssertEqual(receivedError as NSError?, expectedError, file: file, line: line)
    }
    
    private func uniqueImage() -> FeedImage {
        FeedImage(id: UUID(), description: "any", 
                 location: "any", url: anyURL())
    }
    
    private func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
        let models = [uniqueImage(), uniqueImage()]
        let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
        return (models, local)
    }
    
    private func anyURL() -> URL {
        URL(string: "http://any-url.com")!
    }

    private func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }
}
