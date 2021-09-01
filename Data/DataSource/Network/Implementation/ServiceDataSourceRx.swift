//
//  ServiceDataSourceRx.swift
//  JRListArticle
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 30/08/21.
//

import Foundation
import RxSwift

protocol ServiceDataSourceRxProtocol{
    func getListArticles()->Observable<[HitEntity]>
}

class ServiceDataSourceRx: ServiceDataSourceRxProtocol{
    
    func getListArticles()->Observable<[HitEntity]>{
        
        return Observable.create { (observer) -> Disposable in
            let session = URLSession.shared
            let url = URL(string: "http://hn.algolia.com/api/v1/search_by_date?query=ios")
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request) {(data,response,error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else {return}
                
                if response.statusCode == 200{
                    do {
                        let decoder = JSONDecoder()
                        let articles = try decoder.decode(ArticleEntity.self, from: data)
                        observer.onNext(articles.hits)
                    } catch let error {
                        let dataError = ServiceErrorHandler.get(code: nil, description: error.localizedDescription)
                        observer.onError(ErrorEntity.get(dataError))
                        print(error.localizedDescription)
                    }
                }
                else if response.statusCode == 401{
                    print("error 401")
                }
                observer.onCompleted()
                
            }.resume()
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
}
