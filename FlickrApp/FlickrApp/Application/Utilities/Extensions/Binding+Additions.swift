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
    /* A helper function to assign some action in a closure that will
     be executed after the value of the binding has been changed */
    Binding(
      get: { self.wrappedValue },
      set: { newValue in
        self.wrappedValue = newValue
        handler(newValue)
      }
    )
  }
}
