//
//  BaseResponseModel.swift
//  NyArticles
//
//  Created by parth on 21/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponseModel: NSObject,Mappable {
    var status: String?
    var copyRight: String?
    var numResults:Double?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        status <- map["status"]
        copyRight <- map["copyright"]
        numResults <- map["num_results"]
    }
}
