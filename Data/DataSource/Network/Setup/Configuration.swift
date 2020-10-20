//
//  Configuration.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

enum Platform : String{
    case ios
    case android
}

public protocol Configuration {
   static var serverBaseUrl: String { get }
}

struct AppConfig: Configuration {

    static let serverBaseUrl = "http://hn.algolia.com/api/v1"

}
