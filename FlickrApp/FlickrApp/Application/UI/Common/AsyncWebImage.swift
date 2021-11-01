//
//  AsyncWebImage.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import SwiftUI
import SDWebImageSwiftUI

struct AsyncWebImage: View {
  private(set) var sourceURL: URL?
  
  init(url: URL?) {
    sourceURL = url
  }
  
    var body: some View {
      WebImage(url: sourceURL)
        .resizable()
        .placeholder {
          Rectangle().foregroundColor(.gray)
        }
        .indicator(.activity)
        .transition(.fade(duration: 0.5))
        .scaledToFit()
    }
}

struct AsyncWebImage_Previews: PreviewProvider {
    static var previews: some View {
      AsyncWebImage(url: URL(string: ""))
    }
}
