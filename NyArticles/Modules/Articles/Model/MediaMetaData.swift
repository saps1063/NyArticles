//
//  MediaMetaData.swift
//  NyArticles
//
//  Created by parth on 24/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaMetaData: NSObject,Mappable {

    var url: String?
    var format: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        format <- map["format"]
    }
    
}
