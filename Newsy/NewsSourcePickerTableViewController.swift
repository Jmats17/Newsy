//
//  NewsSourcePickerTableViewController.swift
//  Newsy
//
//  Created by Justin Matsnev on 6/12/17.
//  Copyright © 2017 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class NewsSourcePickerTableViewController : UITableViewController {
    
    let dataRetriever = DataRetriever()
    var articles = [Article]() {
        didSet {
            tableView.reloadData()

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dataRetriever.retrieveArticles(apiToContact: Constants.NewsLinks.sports, completionHandler: { articles in
            self.articles = articles
        })
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        
        let article = articles[indexPath.row]
        
        cell.titleLabel.text = article.title
        cell.authorLabel.text = article.author
        cell.dateLabel.text = article.publishDate
        if article.url != "" && article.url != nil {
            cell.newsImage.sd_setImage(with: URL(string: article.url))
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    
}
