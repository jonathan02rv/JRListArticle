//
//  ArticlesRepository.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

public class ArticlesRepository: ArticlesRepositoryProtocol{
    
    private let dataSource: ServiceDataSourceProtocol
    
    public init(){
        self.dataSource = ServiceDataSource()
    }
    
    public func getListArticles(completion: @escaping (Result<[HitModel], Error>) -> Void) {
        self.dataSource.getListArticles(request: ArticleRequestObject(platform: .ios)) { result in
            
            switch result{
            case .success(let data):
                completion(.success(ArticleEntity.mapperArticleEntity(dataArticles: data).hits))
            case .failure(let error):
                completion(.failure(ErrorEntity.get(error)))
            }
        }
    }
    
    
}
