//
//  FlickrFeed.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

struct FlickrFeed {
  var title: String
  var link: String
  var description: String
  var modified: String
  var generator: String
  var items: [Item]
}

extension FlickrFeed {
  struct Item: Identifiable {
    let id = UUID()
    var title: String
    var link: String
    var media: MediaData
    var dateTaken: String
    var description: String
    var published: String
    var author: String
    var authorId: String
    var tags: String
  }
}

extension FlickrFeed.Item {
  struct MediaData {
    var m: String
  }
}

extension FlickrFeed.Item {
  var sourceURL: URL? {
    return URL(string: self.media.m)
  }
  
  var imageSize: (width: Int, height: Int)? {
    let pattern = ".*width=\"(?<width>\\d+)\".*height=\"(?<height>\\d+)\""
    guard let regex = try? NSRegularExpression(
            pattern: pattern,
            options: .caseInsensitive),
          
          let match = regex.firstMatch(
            in: description,
            options: [],
            range: NSRange(location: 0, length: description.utf16.count)),
          
          let widthRange = Range(match.range(withName: "width"), in: description),
          let heightRange = Range(match.range(withName: "height"), in: description)
    else {
      return nil
    }
    
    let widthText = description[widthRange]
    let heightText = description[heightRange]
    
    guard let width = Int(widthText),
          let height = Int(heightText)
    else {
      return nil
    }
    
    return (width: width, height: height)
  }
  
  var processedTags: String {
    return tags.split(separator: " ").joined(separator: ", ")
  }
}
