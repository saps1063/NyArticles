//
//  ServiceProvider.swift
//  WeatherApp
//
//  Created by Akshar Darji on 11/10/18.
//  Copyright © 2018 Akshar Darji. All rights reserved.
//

import Foundation
import  Moya

enum ServiceProvider {
    case allSections(params: [String : Any])
}

extension ServiceProvider : TargetType {
    
    var baseURL: URL {
        return (AppConst.currentEnvironment.apiUrl + "/svc/mostpopular/v2/mostviewed/").toUrl
    }
   
    var path: String {
        switch self {
        case .allSections: return "all-sections/7.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .allSections: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .allSections(var params): return .requestParameters(parameters: setDefaultParam(params: &params), encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .allSections: return nil
        }
    }
    
    func setDefaultParam(params:inout [String : Any]) -> [String : Any]{
        params["api-key"] = "80934d4fde5844e0b26ca6826b010284"
        return params
    }
}
