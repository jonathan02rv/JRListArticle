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
    func getArticleUrl()-> String
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
    func getArticleUrl() -> String {
        guard let viewData = (viewData as? ArticleViewData) else{return ""}
        return viewData.storyUrl
    }
    
    func getTitleView() -> String {
        return Constants.ViewTitle.detailArticle
    }
    
    func goToPreviusView(){
        router.routeToPreviusView()
    }
}
