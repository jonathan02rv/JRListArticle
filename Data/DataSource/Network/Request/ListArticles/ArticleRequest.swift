//
//  ArticleRequest.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation
import Alamofire

internal struct ArticleRequestObject: RequestObject{
    var path: String = "/search_by_date?query="
    let method: HTTPMethod = .get
    var headers: HTTPHeaders
    let encoding: JSONEncoding = .default
    var parameters: Parameters = [:]
    
    init(platform: Platform) {
        headers = headerDefault
        path += platform.rawValue
    }
}
