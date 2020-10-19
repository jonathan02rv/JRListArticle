//
//  ListArticlesViewController.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import UIKit

protocol ListArticlesViewControllerProtocol: class{
    func reloadTable()
    func startLoading()
    func finishRefresh()
}

class ListArticlesViewController: UIViewController {
    
    @IBOutlet weak var tblListArticles: UITableView!
    
    lazy var refreshControl:UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshData(_:)), for: .valueChanged)
        return refreshControl
    }()

    
    var presenter: ListArticlesPresenterProtocol!
    let configurator = ListArticlesConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = presenter.getTitleView()
    }
    
    
    private func viewSetup(){
        configurator.configure(controller: self)
        setupTableView()
        presenter.viewDidLoad()
    }
    
    
    func setupTableView(){
        let nibInputText = UINib.init(nibName: "ArticleTableViewCell", bundle: nil)
        self.tblListArticles.register(nibInputText, forCellReuseIdentifier: "ArticleTableViewCell")
        self.tblListArticles.addSubview(self.refreshControl)
    }
    
    @objc func refreshData(_ refreshControl: UIRefreshControl){
        presenter.getArticles()
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            presenter.removeArticle(forRow: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.routeToDetailArticle(forRow: indexPath.row)
    }
    
    
    
    
}

extension ListArticlesViewController: ListArticlesViewControllerProtocol{
    func startLoading() {
        self.showActivity()
    }
    
    func reloadTable(){
        self.tblListArticles.reloadData()
    }
    
    func finishRefresh(){
        self.refreshControl.endRefreshing()
        self.hideActivity()
    }
}
