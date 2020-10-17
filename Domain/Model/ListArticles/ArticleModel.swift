//
//  ArticleModel.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/16/20.
//

import Foundation


public struct ArticleModel{
    public let hits: [HitModel]?
    
    public init(hits: [HitModel]?){
        self.hits = hits
    }
}
