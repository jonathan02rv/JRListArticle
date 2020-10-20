//
//  HiteEntity.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/16/20.
//

import Foundation

struct HitEntity: Codable{
    var story_title: String?
    var objectID: String?
    var story_url: String?
    var created_at: String?
}


//MARK: - MAPPER
extension HitEntity {

    static func mapperArray(dataArray:[HitEntity])-> [HitModel]{
        return dataArray.map { HitModel(storyTitle: $0.story_title ?? "", articleId: $0.objectID ?? "", storyUrl: $0.story_url ?? "", createdAt: Utils.getDateFromString($0.created_at ?? ""))
            
        }
    }
}
