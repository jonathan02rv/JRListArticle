//
//  StorageDataRepositoryProtocol.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/18/20.
//

import Foundation

public protocol StorageDataRepositoryProtocol: RepositoryProtocol{
    func updateStorageArticles(articles: [HitModel])
    func getStorageArticles()->[HitModel]
    func deleteArticle(forId articleId: String) -> Bool
}
