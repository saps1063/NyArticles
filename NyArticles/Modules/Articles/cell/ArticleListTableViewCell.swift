//
//  ArticleListTableViewCell.swift
//  NyArticles
//
//  Created by parth on 24/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import UIKit

class ArticleListTableViewCell: UITableViewCell,ReusableView {

    @IBOutlet weak var lblArticleTitle:UILabel?
    @IBOutlet weak var lblArticleDetail:UILabel?
    @IBOutlet weak var lblDate:UILabel?
    @IBOutlet weak var imgArticle:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(article:NYArticleList) {
        self.lblArticleTitle?.text = article.title
        self.lblArticleDetail?.text = article.byLine
        self.lblDate?.text = article.publishedDate
        if(article.media != nil && article.media?.first?.mediaMetaData != nil) {
            self.imgArticle?.setWith(image: (article.media?.first?.mediaMetaData?.first?.url)!, placeHolder: UIImage(named: "Placeholder")!)
        //self.imgArticle?.sd_setImage(with: URL(string: (article.media?.first?.mediaMetaData?.first?.url)!), completed: nil)
        }
    }
}
