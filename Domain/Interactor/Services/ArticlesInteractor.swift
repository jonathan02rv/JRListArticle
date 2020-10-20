//
//  ArticlesInteractor.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

public protocol ArticlesInteractorProtocol{
    func getListArticles(completion: @escaping (Result<[HitModel], Error>) -> Void)
}

public class ArticlesInteractor:Interactor, ArticlesInteractorProtocol{
    public func getListArticles(completion: @escaping (Result<[HitModel], Error>) -> Void) {
        return(self.repository as! ArticlesRepositoryProtocol).getListArticles { (result) in
            switch result{
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
