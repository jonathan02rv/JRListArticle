//
//  DetailArticlePresenter.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/19/20.
//

import Foundation

protocol DetailArticlePresenterProtocol{
    func getTitleView()-> String
    func goToPreviusView()
    func viewDidLoad()
}

class DetailArticlePresenter{
    private weak var view: DetailArticleViewControllerProtocol?
    private var router: DetailArticleRouterProtocol!
    private var viewData: ViewData?
    
    init(view: DetailArticleViewControllerProtocol, router: DetailArticleRouterProtocol, withData viewData: ViewData?) {
        self.view = view
        self.router = router
        self.viewData = viewData
    }
}

extension DetailArticlePresenter: DetailArticlePresenterProtocol{
    
    func viewDidLoad(){
        
    }
    
    func getTitleView() -> String {
        return Constants.ViewTitle.detailArticle
    }
    
    func goToPreviusView(){
        router.routeToPreviusView()
    }
}
