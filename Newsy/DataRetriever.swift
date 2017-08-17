//
//  DataRetriever.swift
//  Newsy
//
//  Created by Justin Matsnev on 8/17/17.
//  Copyright © 2017 Justin Matsnev. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct DataRetriever {
    
    
    func retrieveArticles(apiToContact : String, completionHandler: @escaping ((_ result: [Article])->()))  {
        var articles = [Article]()
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let articleData = json["articles"].arrayValue
                    for article in articleData {
                        let article = Article(json: article)
                        articles.append(article)
                    }
                    return completionHandler(articles)
                    
                }
            case .failure(let error):
                print(error)
                return 
            }
        }
    }
}
