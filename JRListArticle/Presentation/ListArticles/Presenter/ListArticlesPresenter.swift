//
//  ListArticlesPresenter.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

protocol ListArticlesPresenterProtocol{
    func getArticles()
}

class ListArticlesPresenter{
    private weak var view: ListArticlesViewControllerProtocol!
    private var interactorArticles: ArticlesInteractorProtocol!
    private var router: ListArticlesRouter!
    
    init(view: ListArticlesViewControllerProtocol, interactorArticles: ArticlesInteractorProtocol, router: ListArticlesRouter) {
        self.view = view
        self.interactorArticles = interactorArticles
        self.router = router
    }
}

extension ListArticlesPresenter: ListArticlesPresenterProtocol{
    func getArticles(){
        
        interactorArticles.getListArticles { [weak self](result) in
            
            guard let _ = self else{return}
            
            switch result{
            case .success(let data):
                print("SUCCESS: \(data)")
            case .failure(let error):
                print("ERROR: \(error)")
            }
            
        }
        
    }
}
