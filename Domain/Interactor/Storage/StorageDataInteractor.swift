//
//  StorageDataInteractor.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/18/20.
//

import Foundation

public protocol StorageDataInteractorProtocol{
    func updateStorageArticles(articles: [HitModel])
    func getStorageArticles()->[HitModel]
}

public class StorageDataInteractor: Interactor, StorageDataInteractorProtocol{
    public func updateStorageArticles(articles: [HitModel]) {
        (self.repository as! StorageDataRepositoryProtocol).updateStorageArticles(articles: articles)
    }
    
    public func getStorageArticles() -> [HitModel] {
        return (self.repository as! StorageDataRepositoryProtocol).getStorageArticles()
    }
    
    
}
