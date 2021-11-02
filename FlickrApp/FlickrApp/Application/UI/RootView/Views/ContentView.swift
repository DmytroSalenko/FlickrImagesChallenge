//
//  ContentView.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-10-31.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.injected) private var injected: DIContainer
  @StateObject var textObserver = Debouncer("", interval: 0.5)
  @State private var tagSearchData: Loadable<FlickrFeed> = .idle
  
  var body: some View {
    NavigationView {
      VStack {
        searchTextField
        .padding()
        
        pageContentView
      }
      .navigationBarHidden(true)
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
        TextField("One or multiple comma-separated tags",
          text: $textObserver.immediateValue)
          .onReceive(textObserver.$debouncedValue, perform: {
            if !$0.isEmpty {
              performTagSearch(tags: $0)
            } else {
              clearFeed()
            }
          })
      }
    }
  }
  
  @ViewBuilder var pageContentView: some View {
    switch tagSearchData {
    case .idle:
      noResultsText
    case .isLoading:
      loadingAnimation
    case .loaded(let data):
      FeedGrid(items: data.items)
    case .failed(_):
      Spacer()
    @unknown default:
      Spacer()
    }
  }
  
  @ViewBuilder var noResultsText: some View {
    VStack {
      Spacer()
      Text("Nothing to show yet")
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
    injected.interactors.flickrFeedInteractor
      .performLogIn($tagSearchData, tags: tags)
  }
  
  func clearFeed() {
    injected.interactors.flickrFeedInteractor
      .cancelSubscriptions()
    tagSearchData = .idle
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
