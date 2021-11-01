//
//  Binding+Additions.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation
import SwiftUI

extension Binding {
  typealias ValueClosure = (Value) -> Void
  
  func onSet(_ handler: @escaping ValueClosure) -> Binding<Value> {
    Binding(
      get: { self.wrappedValue },
      set: { newValue in
        self.wrappedValue = newValue
        handler(newValue)
      }
    )
  }
}
