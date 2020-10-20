//
//  DetailArticleConfigurator.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/19/20.
//

import Foundation

protocol DetailArticleConfiguratorProtocol {
    func configure(controller: DetailArticleViewController)
}

class DetailArticleConfigurator: DetailArticleConfiguratorProtocol{
    func configure(controller: DetailArticleViewController) {
        let router = DetailArticleRouter(withView: controller)
        controller.presenter = DetailArticlePresenter(view: controller, router: router, withData: controller.viewData)
    }
    
    
}
