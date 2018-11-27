//
//  String.swift
//  NyArticles
//
//  Created by parth on 20/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation

extension String {
    
    var toUrl: URL {
        return URL(string: self)!
    }
}
