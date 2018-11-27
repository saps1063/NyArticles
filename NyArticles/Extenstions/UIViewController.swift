//
//  UIViewController.swift
//  NyArticles
//
//  Created by parth on 19/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    /// Get instance of any UIViewController type
    ///
    /// - Parameters:
    ///     - appStoryboard: Input storyboard containing that UIViewController
    static func instantiateFrom(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
