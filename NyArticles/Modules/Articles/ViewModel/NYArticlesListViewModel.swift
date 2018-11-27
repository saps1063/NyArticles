//
//  NYArticlesListViewModel.swift
//  NyArticles
//
//  Created by parth on 21/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import Foundation
import SVProgressHUD
struct NYArticlesListViewModel {
    
}

extension NYArticlesListViewModel{
    
    func getNYArticleList(apiParams:[String:Any],completion:@escaping ((NYArticleListResponse)->Void)) {
        SVProgressHUD.show()
        NetworkService.shared.callService(NetworkService.shared.serviceProvider, type: ServiceProvider.allSections(params: apiParams), success: { (result: NYArticleListResponse) in
            SVProgressHUD.dismiss()
            return completion(result)
        }) { (error) in
            SVProgressHUD.dismiss()
        }
}

}
