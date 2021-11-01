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
  static func getFeed(tags: String) -> Self {
    let path = "/services/feeds/photos_public.gne"
    let queryItems = [URLQueryItem(name: "format", value: OutputFormat.json.rawValue),
                      URLQueryItem(name: "nojsoncallback", value: "1"),
                      URLQueryItem(name: "tags", value: tags)]
    return APIEndpoint(path: path, queryItems: queryItems)
  }
}

extension APIEndpoint {
  enum OutputFormat: String {
    case json
    case xml
  }
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
  
  func getFeed(endpoint: APIEndpoint) -> AnyPublisher<FlickrFeedDTO, Error> {
    execute(endpoint.request, decodingType: FlickrFeedDTO.self )
  }
}
