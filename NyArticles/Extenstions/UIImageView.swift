//
//  UIImageView.swift
//  NyArticles
//
//  Created by parth on 20/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    func setWith(image url: String, placeHolder: UIImage) {
        if url != ""{
            self.sd_setImage(with: url.toUrl, placeholderImage: placeHolder, options: [.refreshCached,.retryFailed,.progressiveDownload], completed: nil)
            
        } else {
            self.image = placeHolder
        }
    }
}
