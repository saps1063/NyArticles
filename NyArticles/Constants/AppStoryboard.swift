//
//  AppStoryboard.swift
//  NyArticles
//
//  Created by parth on 19/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import UIKit

/// Usage: let controller = LaunchViewController.instantiateFrom(appStoryboard: .Main). Declare case for each new storyboard created.
enum AppStoryboard: String {
    
    case Main
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardId = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardId) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
