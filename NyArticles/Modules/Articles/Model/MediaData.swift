//
//  MediaData.swift
//  NyArticles
//
//  Created by parth on 24/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaData: NSObject,Mappable {

    var type: String?
    var subType: String?
    var mediaMetaData:[MediaMetaData]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        type <- map ["type"]
        subType <- map["subtype"]
        mediaMetaData <- map["media-metadata"]
    }
}
