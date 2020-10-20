//
//  DetailArticleViewController.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/19/20.
//

import UIKit
import WebKit

protocol DetailArticleViewControllerProtocol: class{
    
}

class DetailArticleViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
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
        loadWebView()
    }
    
    private func loadWebView(){
        if let myUrlArticle = URL(string: presenter.getArticleUrl()), UIApplication.shared.canOpenURL(myUrlArticle){
            self.webView.navigationDelegate = self
            self.webView.load(URLRequest(url: myUrlArticle))
            self.showActivity()
            webView.allowsBackForwardNavigationGestures = true
        }else{
            presenter.goToPreviusView()
            print("Don`t open url")
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideActivity()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.hideActivity()
    }

}

extension DetailArticleViewController: DetailArticleViewControllerProtocol{
    
}
