//
//  ServiceDataSource.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation
import Alamofire

class ServiceDataSource: ServiceDataSourceProtocol{
    
    private var sessionManager: SessionManager?
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        
        self.sessionManager = Alamofire.SessionManager(configuration: configuration, serverTrustPolicyManager:  ServerTrustPolicyManager(policies: serverTrustPolicies))
    }
    
    
    func getListArticles(request: RequestObject, completion: @escaping (Swift.Result<ArticleEntity, Error>) -> Void) {
        if Reachability.isConnectedToNetwork(){
            guard let requestRef = request as? ArticleRequestObject else{return}
            
            let baseURL = AppEnvironment.configuration.serverBaseUrl
            //MARK:- PRINT BASE URL FOR CHECK THE SETUP ENVIROMENT IS WORK
            print(baseURL)
            
            //MARK:- WE HAVE TO USE PROD ENVIROMENT BECAUSE OTHERS API REST NO YET IMPLEMENTS
            let url = ProdAppConfig.serverBaseUrl + requestRef.path
            
            
            
            sessionManager?.request(url, method: requestRef.method, parameters: nil, encoding: requestRef.encoding, headers: requestRef.headers).validate().debugLog().responseData(completionHandler: { (response) in
                
                let responseStr = NSString(data: response.data ?? Data(), encoding: String.Encoding.utf8.rawValue)
                debugPrint("RESPONSE LIST ARTICLES: \(responseStr ?? "")")
                
                switch response.result{
                case .success(let data):
                    guard let dataResponse = try? JSONDecoder().decode(ArticleEntity.self, from: data) else{
                        return completion(.failure(ServiceErrorHandler.get(code: nil, description: nil)))
                    }
                    completion(.success(dataResponse))
                    break
                case .failure(let error):
                    guard let data = response.data , let serviceError =  try? JSONDecoder().decode(BaseResponseEntity.self, from: data)  else {
                        return completion(.failure(ServiceErrorHandler.get(code: nil, description: error.localizedDescription)))
                    }
                    completion(.failure(ServiceErrorHandler.get(code: serviceError.code, description: serviceError.description)))
                }
            })
        }else{
            completion(.failure(ServiceErrorHandler.getNetworkError()))
        }
    }
    
    
}

extension Request {
    
    public func debugLog() -> Self {
        TimberjackHelper.logBody(_newRequest: self.request!)
        return self
    }
}
