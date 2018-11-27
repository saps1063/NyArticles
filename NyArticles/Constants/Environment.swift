//
//  AppString.swift
//  NyArticles
//
//  Created by parth on 19/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation

enum Environment : String
{
    case development = "Development"
    case production = "Production"
    
    
    var apiUrl: String {
        switch self {
        case .development: return "http://api.nytimes.com"
        case .production: return "http://api.nytimes.com"
        }
    }
    
    var articlesUrl: String {
        switch self {
        case .development: return apiUrl + "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
        case .production: return apiUrl + "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
        }
    }
}
