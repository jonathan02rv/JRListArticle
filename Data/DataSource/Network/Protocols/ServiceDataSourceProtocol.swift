//
//  ServiceDataSourceProtocol.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

internal protocol ServiceDataSourceProtocol{
    func getListArticles(request: RequestObject, completion: @escaping (Swift.Result<ArticleEntity,Error>)->Void)
}
