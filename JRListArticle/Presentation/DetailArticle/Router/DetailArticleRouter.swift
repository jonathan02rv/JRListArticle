//
//  DetailArticleRouter.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/19/20.
//

import UIKit

protocol DetailArticleRouterProtocol{
    func routeToPreviusView()
}


class DetailArticleRouter{
    weak var currentViewController: DetailArticleViewController?
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    init(withView viewController: DetailArticleViewController) {
        self.currentViewController = viewController
    }
}


extension DetailArticleRouter: DetailArticleRouterProtocol{
    func routeToPreviusView() {
        guard let view = self.currentViewController else { return }
        view.navigationController?.popViewController(animated: true)
    }
    
}
