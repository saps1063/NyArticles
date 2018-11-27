//
//  NYArticleListResponse.swift
//  NyArticles
//
//  Created by parth on 23/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import ObjectMapper

class NYArticleListResponse: BaseResponseModel {
    
    var articleList: [NYArticleList]?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        articleList <- map["results"]
    }
}
