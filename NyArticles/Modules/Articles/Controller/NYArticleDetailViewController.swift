//
//  NYArticleDetailViewController.swift
//  NyArticles
//
//  Created by parth on 27/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import UIKit

class NYArticleDetailViewController: BaseViewController {

    @IBOutlet weak var lblTitleValue:UILabel?
    @IBOutlet weak var lblAbstractValue:UILabel?
    @IBOutlet weak var lblBylineValue:UILabel?
    @IBOutlet weak var lblTypeValue:UILabel?
    @IBOutlet weak var lblViewsValue:UILabel?
    @IBOutlet weak var lblAdxKeyWordsValue:UILabel?
    @IBOutlet weak var lblPublishedDateValue:UILabel?
    @IBOutlet weak var lblSourceValue:UILabel?
    @IBOutlet weak var imgVwArticle:UIImageView?
    var article:NYArticleList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Article Detail"
        self.setUpArticleDetail()
        // Do any additional setup after loading the view.
    }
    
    func setUpArticleDetail() {
        self.lblTitleValue?.text = self.article?.title ?? ""
        self.lblAbstractValue?.text = self.article?.abstract ?? ""
        self.lblBylineValue?.text = self.article?.byLine ?? ""
        self.lblTypeValue?.text = self.article?.type ?? ""
        self.lblViewsValue?.text = "\(self.article?.views ?? 0)"
        self.lblAdxKeyWordsValue?.text = self.article?.adxKeywords ?? ""
        self.lblPublishedDateValue?.text = self.article?.publishedDate ?? ""
        self.lblSourceValue?.text = self.article?.source ?? ""
        if article?.media != nil {
            let mediaMetaData = article?.media?.first {$0.type == "image" }
            if mediaMetaData != nil {
                
                let image = mediaMetaData?.mediaMetaData?.first {$0.format == "Large"}
                if image != nil {
                    self.imgVwArticle?.setWith(image: (image?.url)!, placeHolder: UIImage(named: "Placeholder")!)
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
