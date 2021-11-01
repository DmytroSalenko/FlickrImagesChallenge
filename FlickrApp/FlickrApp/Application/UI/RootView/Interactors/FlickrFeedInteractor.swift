//
//  FlickrFeedInteractor.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

protocol FlickrFeedInteractorProtocol {
  
}

final class FlickrFeedInteractor: FlickrFeedInteractorProtocol {
  let flickrFeedClient: FlickrFeedClient
  var cancelBag = CancelBag()
  
  init(flickrFeedClient: FlickrFeedClient) {
    self.flickrFeedClient = flickrFeedClient
  }
}

struct StubFlickrFeedInteractor: FlickrFeedInteractorProtocol {
  
}
