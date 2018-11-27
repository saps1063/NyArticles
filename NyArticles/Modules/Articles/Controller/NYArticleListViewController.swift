//
//  NYArticleListViewController.swift
//  NyArticles
//
//  Created by parth on 21/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import UIScrollView_InfiniteScroll

class NYArticleListViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblView: UITableView!
    var articleList:[NYArticleList]?
    var selectedArticle:NYArticleList?
    
    lazy var nyArticleListViewModel: NYArticlesListViewModel = {
        return NYArticlesListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.estimatedRowHeight = 100
        self.tblView.rowHeight = UITableView.automaticDimension
        self.fetchingArticleList()
        self.loadMoreData()
        // Do any additional setup after loading the view.
    }
    
    /// Fetching Article List.
    func fetchingArticleList() {
        let params:[String:Any] = self.articleList == nil ? [:] : ["offset":self.articleList?.count ?? 0]
        nyArticleListViewModel.getNYArticleList(apiParams: params) { nyarticleResponse in
            print(nyarticleResponse)
            if(nyarticleResponse.articleList != nil && (nyarticleResponse.articleList?.count)! > 0){
                if self.articleList == nil {
                    self.articleList = [NYArticleList]()
                }
                self.articleList?.append(contentsOf:
                    (nyarticleResponse.articleList)!)
                self.tblView.reloadData()
                self.tblView.finishInfiniteScroll()
            }
            
        }
    }
    
    // MARK: - TableView DataSource and Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListTableViewCell.reuseIdentifier, for: indexPath) as! ArticleListTableViewCell
        cell.configureCell(article: (self.articleList?[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedArticle = self.articleList?[indexPath.row]
        self.performSegue(withIdentifier: "NYArticleDetail", sender: nil)
    }
    
    func loadMoreData() {
        // Set custom indicator
        self.tblView.addInfiniteScroll { (tableView) -> Void in
            self.fetchingArticleList()
        }
        self.tblView.setShouldShowInfiniteScrollHandler { _ -> Bool in
            // Only show indicator while data coming
            return true
        }
        let frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        self.tblView.infiniteScrollIndicatorView = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType.triangleSkewSpin, color: UIColor.white, padding: 0)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NYArticleDetail" {
            let articleDetail = segue.destination as? NYArticleDetailViewController
            articleDetail?.article = self.selectedArticle
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
