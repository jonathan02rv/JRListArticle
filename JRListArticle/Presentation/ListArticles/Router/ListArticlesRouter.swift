//
//  ListArticlesRouter.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import UIKit

protocol ListArticlesRouterProtocol{
    func routeToDetail(withData viewData: ViewData)
}

class ListArticlesRouter{
    weak var currentViewController: ListArticlesViewController?
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    init(withView viewController: ListArticlesViewController) {
        self.currentViewController = viewController
    }
}

extension ListArticlesRouter: ListArticlesRouterProtocol{
    func routeToDetail(withData viewData: ViewData) {
        guard let detailController = storyboard.instantiateViewController(withIdentifier: "DetailArticleViewController") as? DetailArticleViewController, let view = currentViewController else { return }
        detailController.viewData = viewData
        view.navigationController?.pushViewController(detailController, animated: true)
    }
    
    
}
