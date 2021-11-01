//
//  FlickrFeed.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

struct FlickrFeedDTO: Codable {
  var title: String
  var link: String
  var description: String
  var modified: String
  var generator: String
  var items: [Item]
}

extension FlickrFeedDTO {
  struct Item: Codable {
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


extension FlickrFeedDTO.Item {
  struct MediaData: Codable {
    var m: String
  }
}
