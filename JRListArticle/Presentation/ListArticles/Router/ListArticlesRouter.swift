//
//  ListArticlesRouter.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import UIKit

protocol ListArticlesRouterProtocol{
    func routeToDetail()
}

class ListArticlesRouter{
    weak var currentViewController: ListArticlesViewController?
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    init(withView viewController: ListArticlesViewController) {
        self.currentViewController = viewController
    }
}

extension ListArticlesRouter: ListArticlesRouterProtocol{
    func routeToDetail() {
    }
    
    
}
