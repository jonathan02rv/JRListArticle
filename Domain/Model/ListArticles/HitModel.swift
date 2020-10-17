//
//  HiteModel.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/16/20.
//

import Foundation

public struct HitModel{
    public let storyTitle: String?
    public let commentText: String?
    public let storyUrl: String?
    public let createdAt: String?
    
    public init(storyTitle: String, commentText: String, storyUrl: String, createdAt: String){
        self.storyTitle = storyTitle
        self.commentText = commentText
        self.storyUrl = storyUrl
        self.createdAt = createdAt
    }
}
