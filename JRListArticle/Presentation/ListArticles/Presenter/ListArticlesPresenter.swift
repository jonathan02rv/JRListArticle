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
}

class ListArticlesPresenter{
    
    private weak var view: ListArticlesViewControllerProtocol?
    private var interactorArticles: ArticlesInteractorProtocol!
    private var router: ListArticlesRouter!
    
    var listHit = [HitModel]()
    
    init(view: ListArticlesViewControllerProtocol, interactorArticles: ArticlesInteractorProtocol, router: ListArticlesRouter) {
        self.view = view
        self.interactorArticles = interactorArticles
        self.router = router
    }
}

//MARK: - Protocol Implement
extension ListArticlesPresenter: ListArticlesPresenterProtocol{
    func getNumberOfRows() -> Int {
        return self.listHit.count
    }
    
    func getCellData(forRow row: Int)->(titleText: String, createAtText: String){
        let dataRow = listHit[row]
        return (dataRow.storyTitle ?? "", dataRow.createdAt ?? "")
    }
    
    
    func viewDidLoad(){
        self.getArticles()
    }
    
}

//MARK: - Call Service
extension ListArticlesPresenter{
    func getArticles(){
        self.interactorArticles.getListArticles { [weak self](result) in
            guard let sweak = self else{return}
            switch result{
            case .success(let data):
                sweak.listHit = data
                sweak.view?.reloadTable()
                print("SUCCESS: \(data)")
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
