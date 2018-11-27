//
//  AppConstant.swift
//  NyArticles
//
//  Created by parth on 19/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import UIKit
struct AppConst {
    
    static var currentEnvironment: Environment {
        var config = Configuration()
        return config.environment
    }
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let userDefault = UserDefaults.standard
    
    //AppName
    static let kAppName : String = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    
}
