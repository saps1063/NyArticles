//
//  NyArticlesUtility.swift
//  NyArticles
//
//  Created by parth on 20/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import UIKit

class NyArticles {
    
    
    static let shared = NyArticles()
    
    //@function setUserAvailabilityStatus()
    //@abstract This function is use for set online/offline user
    func showAlertViewController(title:String, message:String, okayCallBack:(()->Void)?, cancelCallBack:(()->Void)?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: AppString.Okay, style: .default, handler: { action in
            okayCallBack?()
        }))
        alert.addAction(UIAlertAction(title: AppString.Cancel, style: .cancel, handler: { action in
            cancelCallBack?()
        }))
        
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
}
