//
//  FeedGrid.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import SwiftUI
import SDWebImageSwiftUI

struct FeedGrid: View {
  private var feedItems: [FlickrFeedItem]
  private var gridItemLayout = [GridItem(.adaptive(minimum: 150), alignment: .topLeading)]
  
  init(items: [FlickrFeedItem]) {
    feedItems = items
  }
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: gridItemLayout, spacing: 5) {
        ForEach(feedItems) { feedData in
          NavigationLink(
            destination: DetailsView(feedItemData: feedData),
            label: {
              AsyncWebImage(url: feedData.sourceURL)
            })
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
