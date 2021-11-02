//
//  Debouncer.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation
import Combine

final class Debouncer<T>: ObservableObject {
  private var cancelBag = CancelBag()

  @Published var debouncedValue: T
  @Published var immediateValue: T
  private var debounceInterval: TimeInterval
  
  init(_ value: T, interval: TimeInterval) {
    debouncedValue = value
    immediateValue = value
    debounceInterval = interval
    
    $immediateValue
      .debounce(for: .seconds(debounceInterval), scheduler: DispatchQueue.main)
      .sink(receiveValue: {
        self.debouncedValue = $0
      })
      .store(in: cancelBag)
  }
      
  
  
}
