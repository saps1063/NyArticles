//
//  Configuration.swift
//  NyArticles
//
//  Created by parth on 19/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation

struct Configuration {
    lazy var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.range(of: "Development") != nil {
                return Environment.development
            }
        }
        return Environment.production
    }()
}
