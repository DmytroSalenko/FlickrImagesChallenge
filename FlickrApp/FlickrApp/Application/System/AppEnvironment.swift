//
//  AppEnvironment.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation
import Combine

struct AppEnvironment {
  let container: DIContainer
}

extension AppEnvironment {
  /* The only purpose of this function is to configure our application.
   It instantiates all the interactors and clients in order to inject them
   into the app environment */
  static func bootstrap() -> AppEnvironment {
    let session = configuredURLSession()
    let webClients = configuredWebClients(session: session)
    let interactors = configuredInteractors(webClients: webClients)
    
    let diContainer = DIContainer(interactors: interactors)
    
    return AppEnvironment(container: diContainer)
  }
  
  private static func configuredURLSession() -> URLSession {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 60
    configuration.timeoutIntervalForResource = 120
    configuration.waitsForConnectivity = true
    configuration.httpMaximumConnectionsPerHost = 5
    
    return URLSession(configuration: configuration)
  }
  
  private static func configuredWebClients(session: URLSession) -> DIContainer.WebClients {
    let flickrFeedClient = FlickrFeedClient(session: session)
   
    return .init(flickrFeedClient: flickrFeedClient)
  }
  
  private static func configuredInteractors(webClients: DIContainer.WebClients) -> DIContainer.Interactors {
    let flickrFeedInteractor = FlickrFeedInteractor(flickrFeedClient: webClients.flickrFeedClient)
    
    return .init(flickrFeedInteractor: flickrFeedInteractor)
  }
  
}

extension DIContainer {
  struct WebClients {
    let flickrFeedClient: FlickrFeedClient
  }
}
