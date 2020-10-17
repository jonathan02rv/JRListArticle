//
//  ListArticlesViewController.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import UIKit

protocol ListArticlesViewControllerProtocol: class{
    func reloadTable()
}

class ListArticlesViewController: UIViewController {
    
    @IBOutlet weak var tblListArticles: UITableView!

    
    var presenter: ListArticlesPresenterProtocol!
    let configurator = ListArticlesConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        // Do any additional setup after loading the view.
    }
    
    
    private func viewSetup(){
        configurator.configure(controller: self)
        setupTableView()
        presenter.viewDidLoad()
    }
    
    
    func setupTableView(){
        let nibInputText = UINib.init(nibName: "ArticleTableViewCell", bundle: nil)
        self.tblListArticles.register(nibInputText, forCellReuseIdentifier: "ArticleTableViewCell")
        
    }


}

extension ListArticlesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        let dataForCell = presenter.getCellData(forRow: indexPath.row)
        
        cell.title = dataForCell.titleText
        cell.createAt = dataForCell.createAtText
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
}

extension ListArticlesViewController: ListArticlesViewControllerProtocol{
    func reloadTable(){
        self.tblListArticles.reloadData()
    }
}
