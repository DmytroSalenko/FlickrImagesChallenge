//
//  InteractorContainer.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

extension DIContainer {
  struct Interactors {
    var flickrFeedInteractor: FlickrFeedInteractorProtocol
    
    static var stub: Self {
      .init(flickrFeedInteractor: StubFlickrFeedInteractor())
    }
  }
}
