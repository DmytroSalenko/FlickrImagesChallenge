//
//  FlickrFeedClient.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation
import Combine

// MARK: - Flickr Feed endpoint
extension APIEndpoint {
//  static func getFeed() -> Self {
//
//  }
}

// MARK: - Flickr Feed API client
final class FlickrFeedClient: APIClient {
  let session: URLSession
  
  init(session: URLSession) {
    self.session = session
  }
  
  convenience init() {
    self.init(session: URLSession(configuration: .default))
  }
  
  func logIn(endpoint: APIEndpoint) -> AnyPublisher<FlickrFeedDTO, Error> {
    execute(endpoint.request, decodingType: FlickrFeedDTO.self )
  }
}
