//
//  NYArticleList.swift
//  NyArticles
//
//  Created by parth on 21/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import ObjectMapper

class NYArticleList: NSObject,Mappable {
    var url: String?
    var adxKeywords: String?
    var column:String?
    var section: String?
    var byLine: String?
    var type:String?
    var title: String?
    var abstract: String?
    var publishedDate:String?
    var source: String?
    var articleId: Double?
    var assetId:Double?
    var views:Double?
    var media:[MediaData]?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        adxKeywords <- map["adx_keywords"]
        column <- map["column"]
        section <- map["section"]
        byLine <- map["byline"]
        type <- map["type"]
        title <- map["title"]
        abstract <- map["abstract"]
        publishedDate <- map["published_date"]
        source <- map["source"]
        articleId <- map["id"]
        assetId <- map["asset_id"]
        views <- map["views"]
        media <- map["media"]
    }
}
