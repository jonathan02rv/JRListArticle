//
//  StorageDataSourceProtocol.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/18/20.
//

import Foundation

internal protocol StorageDataSourceProtocol{
    func updateStorageArticles(articles: [HitModel])
    func getStorageArticles()->[HitModel]
}
