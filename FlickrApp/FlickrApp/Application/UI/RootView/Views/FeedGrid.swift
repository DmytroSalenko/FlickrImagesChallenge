//
//  FeedGrid.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import SwiftUI

struct FeedGrid: View {
  private var feedItems: [FlickrFeedItem]
  private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
  init(items: [FlickrFeedItem]) {
    feedItems = items
  }
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: gridItemLayout, spacing: 5) {
        ForEach(feedItems) {
          Color.blue
            .overlay(Text($0.author))
        }
      }
    }
  }
}

struct FeedGrid_Previews: PreviewProvider {
  static var previews: some View {
    FeedGrid(items: [])
  }
}
