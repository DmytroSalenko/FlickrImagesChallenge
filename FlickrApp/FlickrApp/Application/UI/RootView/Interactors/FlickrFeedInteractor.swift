//
//  FlickrFeedInteractor.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

protocol FlickrFeedInteractorProtocol: Unsubscriptable {
  func performFeedSearch(_ feedDataStatus: LoadableSubject<FlickrFeed>, tags: String)
}

final class FlickrFeedInteractor: FlickrFeedInteractorProtocol {
  /* A real implementation of the FlickrFeedInteractorProtocol.
   It contains all the logic related to the work with Flickr feed data */
  let flickrFeedClient: FlickrFeedClient
  var cancelBag = CancelBag()
  
  init(flickrFeedClient: FlickrFeedClient) {
    self.flickrFeedClient = flickrFeedClient
  }
  
  deinit {
    cancelSubscriptions()
  }
  
  func performFeedSearch(_ feedDataStatus: LoadableSubject<FlickrFeed>, tags: String) {
    feedDataStatus.wrappedValue.setIsLoading()
    
    flickrFeedClient.getFeed(endpoint: .getFeed(tags: tags))
      .map {
        FlickrFeedMapper.mapToDAO(from: $0)
      }
      .sinkToLoadable {
        feedDataStatus.wrappedValue = $0
      }
      .store(in: cancelBag)
  }
  
}

struct StubFlickrFeedInteractor: FlickrFeedInteractorProtocol {
  var cancelBag = CancelBag()
  func performFeedSearch(_ feedDataStatus: LoadableSubject<FlickrFeed>, tags: String) {
    
  }
}
