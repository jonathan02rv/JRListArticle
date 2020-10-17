//
//  HiteEntity.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/16/20.
//

import Foundation

struct HitEntity: Codable{
    var story_title: String?
    var comment_text: String?
    var story_url: String?
    var created_at: String?
}


//MARK: - MAPPER
extension HitEntity {

    static func mapperArray(dataArray:[HitEntity])-> [HitModel]{
        return dataArray.map { HitModel(storyTitle: $0.story_title ?? "", commentText: $0.comment_text ?? "", storyUrl: $0.story_url ?? "", createdAt: $0.created_at ?? "")
            
        }
    }
}
