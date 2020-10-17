//
//  ArticlesRepositoryProtocol.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

public protocol RepositoryProtocol{
    
}

public protocol ArticlesRepositoryProtocol: RepositoryProtocol{
    func getListArticles(completion: @escaping (Swift.Result<[HitModel], Error>) -> Void)
}
