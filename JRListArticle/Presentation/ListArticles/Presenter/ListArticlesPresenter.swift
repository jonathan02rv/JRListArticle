//
//  ListArticlesPresenter.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

protocol ListArticlesPresenterProtocol{
    func viewDidLoad()
    func getNumberOfRows()->Int
    func getCellData(forRow row: Int)->(titleText: String, createAtText: String)
    func removeArticle(forRow row: Int)
    func getArticles()
    func getTitleView()-> String
    func routeToDetailArticle(forRow row: Int)
}

class ListArticlesPresenter{
    
    private weak var view: ListArticlesViewControllerProtocol?
    private var interactorStorageData :StorageDataInteractorProtocol!
    private var interactorArticles: ArticlesInteractorProtocol!
    private var router: ListArticlesRouterProtocol!
    
    var listHit = [HitModel]()
    
    init(view: ListArticlesViewControllerProtocol, interactorStorageData: StorageDataInteractorProtocol, interactorArticles: ArticlesInteractorProtocol, router: ListArticlesRouterProtocol) {
        self.view = view
        self.interactorStorageData = interactorStorageData
        self.interactorArticles = interactorArticles
        self.router = router
    }
}

//MARK: - Protocol Implement
extension ListArticlesPresenter: ListArticlesPresenterProtocol{
    func routeToDetailArticle(forRow row: Int) {
        let viewData:ViewData = ArticleViewData(storyUrl: listHit[row].storyUrl ?? "")
        router.routeToDetail(withData: viewData)
    }
    
    func getTitleView()-> String {
        return Constants.ViewTitle.listArticles.localized
    }
    
    func deleteArticle(articleId: String) -> Bool {
        return self.interactorStorageData.deleteArticle(forId: articleId)
    }
    
    func getNumberOfRows() -> Int {
        return self.listHit.count
    }
    
    func getCellData(forRow row: Int)->(titleText: String, createAtText: String){
        let dataRow = listHit[row]
        return (dataRow.storyTitle ?? "", dataRow.createdAt ?? "")
    }
    
    
    func viewDidLoad(){
        self.view?.startLoading()
        self.getArticles()
    }
    
    func removeArticle(forRow row: Int) {
        guard let idArticle = listHit[row].articleId else{return}
        self.listHit.remove(at: row)
        let _ = deleteArticle(articleId: idArticle)
    }
    
    //MARK: - Call Service
    func getArticles(){
        self.interactorArticles.getListArticles { [weak self](result) in
            guard let sweak = self else{return}
            sweak.view?.finishRefresh()
            switch result{
            case .success(let data):
                sweak.interactorStorageData.updateStorageArticles(articles: data)
                sweak.listHit = sweak.interactorStorageData.getStorageArticles()
                sweak.view?.reloadTable()
            case .failure(let error):
                
                sweak.listHit = sweak.interactorStorageData.getStorageArticles()
                sweak.view?.reloadTable()
                
                guard let errorModel =  error as? ErrorModel else {
                    print("ERROR: \(error.localizedDescription)")
                    return
                }
                switch errorModel.type {
                case .networkError,.custom,.unknownError:
                    print("ERROR: \(errorModel.description ?? "")")
                default:
                    break
                }
                
            }
        }
    }
}
