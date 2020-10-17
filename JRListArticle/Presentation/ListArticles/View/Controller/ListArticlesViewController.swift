//
//  ListArticlesViewController.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import UIKit

protocol ListArticlesViewControllerProtocol: class{

}

class ListArticlesViewController: UIViewController {
    
    var presenter: ListArticlesPresenterProtocol!
    let configurator = ListArticlesConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        // Do any additional setup after loading the view.
    }
    
    
    private func viewSetup(){
        configurator.configure(controller: self)
        presenter.getArticles()
    }


}

extension ListArticlesViewController: ListArticlesViewControllerProtocol{
    
}
