//
//  JSONDecoder+Additions.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

extension JSONDecoder {
  func withDecodingStrategy(_ strategy: KeyDecodingStrategy) -> Self {
    keyDecodingStrategy = strategy
    return self
  }
}
