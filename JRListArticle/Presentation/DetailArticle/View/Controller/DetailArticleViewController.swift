//
//  DetailArticleViewController.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/19/20.
//

import UIKit

protocol DetailArticleViewControllerProtocol: class{
    
}

class DetailArticleViewController: UIViewController {
    
    var viewData : ViewData?
    var presenter: DetailArticlePresenterProtocol!
    let configurator = DetailArticleConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = presenter.getTitleView()
    }
    
    private func viewSetup(){
        self.configurator.configure(controller: self)
        presenter.viewDidLoad()
    }

}

extension DetailArticleViewController: DetailArticleViewControllerProtocol{
    
}
