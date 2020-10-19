//
//  StorageDataRepository.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/18/20.
//

import Foundation

public class StorageDataRepository: StorageDataRepositoryProtocol{
    
    private let dataSource: StorageDataSourceProtocol
    public init(){
        self.dataSource = StorageDataSource()
    }
    
    public func updateStorageArticles(articles: [HitModel]) {
        dataSource.updateStorageArticles(articles: articles)
    }
    
    public func getStorageArticles() -> [HitModel] {
        return dataSource.getStorageArticles()
    }
    
    public func deleteArticle(forId articleId: String) -> Bool {
        return dataSource.deleteArticle(forId: articleId)
    }
    
}
