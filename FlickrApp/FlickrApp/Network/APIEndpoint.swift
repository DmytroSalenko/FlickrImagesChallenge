//
//  APIEndpoint.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

enum APIMethod: String {
  case get = "GET"
  case post = "POST"
}

struct APIEndpoint {
  var host: String = "test"
  var path: String
  var method: String = APIMethod.get.rawValue
  var scheme: String = "https"
  var queryItems: [URLQueryItem] = []
  var headers: [String: String]?
  var body: Data?
  
  var baseURL: URL {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    return components.url!
  }
  
  var pathWithQueryItems: URL {
    var components = URLComponents()
    components.path = path
    components.queryItems = queryItems.isEmpty ? nil : queryItems
    return components.url!
  }
  
  var urlComponents: URLComponents {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    components.path = path
    components.queryItems = queryItems.isEmpty ? nil : queryItems
    return components
  }
  
  var request: URLRequest {
    var request = URLRequest(url: urlComponents.url!)
    request.httpMethod = method
    request.httpBody = body
    headers?.forEach { key, value in request.setValue(value, forHTTPHeaderField: key) }
    return request
  }
}
