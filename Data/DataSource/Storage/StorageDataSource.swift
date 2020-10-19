//
//  StorageDataSource.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/18/20.
//

import Foundation
//import CoreData

internal class StorageDataSource: StorageDataSourceProtocol{
    func updateStorageArticles(articles: [HitModel]) {
        DatabaseManager.standard.deleteAllArticles()
        DatabaseManager.standard.addNewArticlesToCoreData(articles)
        DatabaseManager.saveContext()
    }
    
    func getStorageArticles() -> [HitModel] {
        let articles = DatabaseManager.getAllArticles()
        return articles.map { HitModel(storyTitle: $0.storyTitle ?? "", articleId: $0.articleId ?? "", storyUrl: $0.storyUrl ?? "", createdAt: $0.createdAt ?? "")
        }
    }
    
    func deleteArticle(forId articleId: String) -> Bool {
        guard DatabaseManager.deleteArticle(forId: articleId) else{return false}
        DatabaseManager.standard.addTrashArticlesToCoreData(articleId)
        return true
    }
    
}
