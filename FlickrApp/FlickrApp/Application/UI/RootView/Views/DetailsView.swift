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
  private var imageContainer = ImageContainer()
  @State private var displayShareSheet = false
  @State private var imageSize: CGSize?
  
  init(feedItemData: FlickrFeedItem) {
    self.feedItemData = feedItemData
  }
  
  var body: some View {
    VStack {
      Text(feedItemData.title)
      
      imageView
      
      Spacer()
      
      imageDescriptionText
        .padding()
      
    }
    .toolbar(content: {
      Button("Share") {
        if imageContainer.image != nil {
          displayShareSheet.toggle()
        }
      }
    })
    .sheet(isPresented: $displayShareSheet, content: {
      ShareSheet(items: [imageContainer.image!])
    })
  }
}

//MARK: - Content Views
private extension DetailsView {
  @ViewBuilder var imageView: some View {
    WebImage(url: feedItemData.sourceURL)
      .onSuccess() { image, data, cacheType in
        DispatchQueue.main.async {
          imageContainer.image = image
          imageSize = image.size
        }
      }
  }
  
  @ViewBuilder var imageDescriptionText: some View {
    VStack(alignment: .leading) {
      if let imageSize = imageSize {
        Text("Image size: ") + Text("\(imageSize.width, specifier: "%.2f") x \(imageSize.height, specifier: "%.2f")")
      } else {
        Text("Image size: unknown")
      }
      
      Text("Tags: " + feedItemData.processedTags)
        
    }
    .fixedSize(horizontal: false, vertical: true)
    .lineLimit(nil)
  }
}

private extension DetailsView {
  final class ImageContainer {
    var image: UIImage?
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
