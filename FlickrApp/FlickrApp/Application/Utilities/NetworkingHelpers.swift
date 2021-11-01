//
//  NetworkingHelpers.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation
import Combine

extension Publisher {
  func sinkToLoadable(_ completion: @escaping (Loadable<Output>) -> Void) -> AnyCancellable {
    return sink(receiveCompletion: { subscriptionCompletion in
      if let error = subscriptionCompletion.error {
        completion(.failed(error))
      }
    }, receiveValue: { value in
      completion(.loaded(value))
    })
  }
}

extension Subscribers.Completion {
  var error: Failure? {
    switch self {
    case let .failure(error): return error
    default: return nil
    }
  }
}
