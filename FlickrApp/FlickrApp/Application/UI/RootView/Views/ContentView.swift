//
//  ContentView.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-10-31.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.injected) private var injected: DIContainer
  @State private var searchTags = ""
  @State private var tagSearchData: Loadable<FlickrFeedDTO> = .idle
  
  var body: some View {
    VStack {
      searchTextField
      .padding()
      
      pageContentView
    }
    .onDisappear {
      injected.interactors.flickrFeedInteractor.cancelSubscriptions()
    }
    
  }
}

//MARK: - Content Views
private extension ContentView {
  @ViewBuilder var searchTextField: some View {
    VStack {
      HStack(spacing: 10) {
        Image(systemName: "magnifyingglass")
        TextField("One or multiple comma-separated tags" ,
                  text: $searchTags
                    .onSet {
                      if !$0.isEmpty {
                        performTagSearch(tags: $0)
                      }
                    })
      }
    }
  }
  
  @ViewBuilder var pageContentView: some View {
    switch tagSearchData {
    case .idle:
      Spacer()
    case .isLoading:
      loadingAnimation
    case .loaded(let data):
      Spacer()
    case .failed(let error):
      Spacer()
    @unknown default:
      Spacer()
    }
  }
  
  @ViewBuilder var loadingAnimation: some View {
    VStack {
      Spacer()
      ProgressView()
      Spacer()
    }
  }
}


//MARK: - Side Effects
private extension ContentView {
  func performTagSearch(tags: String) {
    injected.interactors.flickrFeedInteractor.performLogIn($tagSearchData, tags: searchTags)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
