//
//  ListArticlesConfigure.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

protocol ListArticlesConfiguratorProtocol{
    func configure(controller: ListArticlesViewController)
}

class ListArticlesConfigurator: ListArticlesConfiguratorProtocol{
    func configure(controller: ListArticlesViewController) {
        let interactorStorageData = StorageDataInteractor(repository: StorageDataRepository())
        let interactorArticle = ArticlesInteractor(repository: ArticlesRepository())
        let router = ListArticlesRouter(withView: controller)
        controller.presenter = ListArticlesPresenter(view: controller, interactorStorageData: interactorStorageData, interactorArticles: interactorArticle, router: router)
    }
    
    
}
