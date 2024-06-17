//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Subhankar  Acharya on 21/05/24.
//

import UIKit
import EssentialFeed
import EssentialFeediOS
import Combine

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(
        feedLoader: @escaping () -> AnyPublisher<[FeedImage], Error>,
        imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher
    ) -> FeedViewController {
        
        let presentationAdapter = FeedLoaderPresentationAdapter(
            feedLoader: feedLoader)
        
        let feedController = makeFeedViewController(
            delegate: presentationAdapter,
            title: FeedPresenter.title)
        
        presentationAdapter.presenter = LoadResourcePresenter(
            resourceView: FeedViewAdapter(
                controller: feedController,
                imageLoader: imageLoader),
            loadingView: WeakRefVirtualProxy(feedController), errorView: WeakRefVirtualProxy(feedController),
            mapper: FeedPresenter.map)
        return feedController
    }
    
    private static func makeFeedViewController(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.delegate = delegate
        feedController.title = title
        return feedController
    }
    
}
