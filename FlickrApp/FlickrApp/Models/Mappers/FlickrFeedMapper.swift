//
//  FlickrFeedMapper.swift
//  FlickrApp
//
//  Created by Dmytro Salenko on 2021-11-01.
//

import Foundation

typealias FlickrFeedMediaData = FlickrFeed.Item.MediaData
typealias FlickrFeedItem = FlickrFeed.Item

struct FlickrFeedMapper {
  static func mapToDAO(from dto: FlickrFeedDTO) -> FlickrFeed {
    let feedItems = dto.items.map {
      FlickrFeedItem(title: $0.title,
                     link: $0.link,
                     media: FlickrFeedMediaData(m: $0.media.m),
                     dateTaken: $0.dateTaken,
                     description: $0.description,
                     published: $0.published,
                     author: $0.author,
                     authorId: $0.authorId,
                     tags: $0.tags)
    }
    
    return FlickrFeed(title: dto.title,
                      link: dto.link,
                      description: dto.description,
                      modified: dto.modified,
                      generator: dto.generator,
                      items: feedItems)
  }
}
