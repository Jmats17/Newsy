//
//  Article.swift
//  Newsy
//
//  Created by Justin Matsnev on 8/17/17.
//  Copyright © 2017 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct Article  {
   
    var author : String
    var title : String
    var description : String
    var url : String
    var image : String?
    var publishDate : String
    
    init(json : JSON) {
        
        self.author = json["author"].stringValue
        self.title = json["title"].stringValue
        self.description = json["description"].stringValue
        self.url = json["url"].stringValue
        self.image = json["urlToImage"].stringValue
        self.publishDate = json["publishedAt"].stringValue

    }
    
    
    
    
}
