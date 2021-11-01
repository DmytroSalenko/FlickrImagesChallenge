//
//  CancelBag.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

import Combine

final class CancelBag {
  var subscriptions = Set<AnyCancellable>()
  
  func cancel() {
    subscriptions.forEach { $0.cancel() }
    subscriptions.removeAll()
  }
}

extension AnyCancellable {
  func store(in cancelBag: CancelBag) {
    cancelBag.subscriptions.insert(self)
  }
}

// MARK: - Adds ability for the Interactor to cancel all Publishers
protocol Unsubscriptable {
  var cancelBag: CancelBag { get }
  func cancelSubscriptions()
}

extension Unsubscriptable {
  func cancelSubscriptions() {
    cancelBag.cancel()
  }
}
