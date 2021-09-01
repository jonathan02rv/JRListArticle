//
//  Environment.swift
//  JRListArticle
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 31/08/21.
//

import Foundation

public enum Environment: String {
    
    case Development = "com.jhonatahan.JRListArticle.dev"
    case UAT = "com.jhonatahan.JRListArticle.uat"
    case Production = "com.jhonatahan.JRListArticle"
}

public extension Environment {
    
    var configuration: Configuration.Type {
        switch self {
        case .Development: return DevAppConfig.self
        case .UAT: return  UatAppConfig.self
        case .Production: return ProdAppConfig.self
        }
    }
}
