//
//  DependencyInjector.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation
import SwiftUI


// MARK: - DIContainer
class DIContainer: EnvironmentKey {
  typealias Value = DIContainer
  static var defaultValue: DIContainer = DIContainer(interactors: .stub)
  
  let interactors: Interactors
  
  init(interactors: Interactors) {
    self.interactors = interactors
  }
}

extension EnvironmentValues {
  var injected: DIContainer {
    get {
      self[DIContainer.self]
    }
    
    set {
      self[DIContainer.self] = newValue
    }
  }
}

// MARK: - Injection in the view hierarchy
extension View {
  
  func inject(_ interactors: DIContainer.Interactors) -> some View {
    let container = DIContainer(interactors: interactors)
    return inject(container)
  }
  
  func inject(_ container: DIContainer) -> some View {
    return self
      .environment(\.injected, container)
  }
}
