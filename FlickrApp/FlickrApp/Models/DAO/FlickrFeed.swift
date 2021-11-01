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
  struct Item {
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
