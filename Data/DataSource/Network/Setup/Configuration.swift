//
//  Configuration.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

public let AppEnvironment: Environment = {
    
    let environment = Environment(rawValue: Bundle.main.bundleIdentifier ?? "")
    switch environment {
    case .Development:
        return Environment.Development
    case .UAT:
        return Environment.UAT
    case .Production:
        return Environment.Production
    default:
        fatalError("Environment Dont Exist")
    }
    
}()


enum Platform : String{
    case ios
    case android
}

public protocol Configuration {
   static var serverBaseUrl: String { get }
}

struct ProdAppConfig: Configuration {
    
    
    static let serverBaseUrl = "http://hn.algolia.com/api/v1"

}

struct UatAppConfig: Configuration {
    
    
    static let serverBaseUrl = "http://hn.algolia.com/api/v1/pre"

}

struct DevAppConfig: Configuration {
    
    
    static let serverBaseUrl = "http://hn.algolia.com/api/v1/dev"

}
