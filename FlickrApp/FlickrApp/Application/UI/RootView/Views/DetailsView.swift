//
//  DetailsView.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsView: View {
  private var feedItemData: FlickrFeedItem
  
  init(feedItemData: FlickrFeedItem) {
    self.feedItemData = feedItemData
  }
  
  var body: some View {
    VStack {
      Text(feedItemData.title)
      WebImage(url: feedItemData.sourceURL)
      Spacer()
      imageData
        .padding()
      
    }
  }
}

//MARK: - Content Views
private extension DetailsView {
  @ViewBuilder var imageData: some View {
    VStack(alignment: .leading) {
      if let imageSize = feedItemData.imageSize {
        Text("Image size: ") + Text("\(imageSize.width)x\(imageSize.height)")
      } else {
        Text("Image size: unknown")
      }
      
      Text("Tags: " + feedItemData.processedTags)
        
    }
    .fixedSize(horizontal: false, vertical: true)
    .lineLimit(nil)
  }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
      DetailsView(feedItemData: FlickrFeedItem(title: "Test",
                                               link: "Test",
                                               media: .init(m: "Test"),
                                               dateTaken: "Test",
                                               description: "Test",
                                               published: "Test",
                                               author: "Test",
                                               authorId: "Test",
                                               tags: "Test"))
    }
}
