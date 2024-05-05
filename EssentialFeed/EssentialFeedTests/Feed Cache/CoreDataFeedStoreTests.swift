//
//  CoreDataFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Subhankar  Acharya on 05/05/24.
//

import XCTest
import EssentialFeed

final class CoreDataFeedStoreTests: XCTestCase, FeedStoreSpecs {
    
    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = makeSUT()
        
        assertThatRetrieveDeliversEmptyOnEmptyCache(on: sut)
    }
    
    func test_retrieve_hasNoSideEffectsOnEmptyCache() {
        let sut = makeSUT()
        
        assertThatRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
    }
    
    func test_retrieve_deliversFoundValuesOnNonEmptyCache() {
        <#code#>
    }
    
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache() {
        <#code#>
    }
    
    func test_insert_deliversNoErrorOnEmptyCache() {
        <#code#>
    }
    
    func test_insert_deliversNoErrorOnNonEmptyCache() {
        <#code#>
    }
    
    func test_insert_overridesPreviouslyInsertedCacheValues() {
        <#code#>
    }
    
    func test_delete_deliversNoErrorOnEmptyCache() {
        <#code#>
    }
    
    func test_delete_hasNoSideEffectsOnEmptyCache() {
        <#code#>
    }
    
    func test_delete_deliversNoErrorOnNonEmptyCache() {
        <#code#>
    }
    
    func test_delete_emptiesPreviouslyInsertedCache() {
        <#code#>
    }
    
    func test_storeSideEffects_runSerially() {
        <#code#>
    }
    
    // - MARK: Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> FeedStore {
        let storeBundle = Bundle(for: CoreDataFeedStore.self)
        let storeURL = URL(fileURLWithPath: "/dev/null")
        let sut = try! CoreDataFeedStore(storeURL: storeURL, bundle: storeBundle)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
 
}
