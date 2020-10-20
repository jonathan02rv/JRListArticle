//
//  ArticleEntity.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/16/20.
//

import Foundation

struct ArticleEntity: Codable{
    var hits: [HitEntity]
}

//MARK: - MAPPER

extension ArticleEntity{
    static func mapperArticleEntity(dataArticles:ArticleEntity)->ArticleModel{
        return ArticleModel(hits: HitEntity.mapperArray(dataArray: dataArticles.hits))
    }
    
}
