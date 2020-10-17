//
//  Requestprotocol.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation
import Alamofire

internal protocol RequestObject {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var encoding: JSONEncoding { get }
    var parameters: Parameters { get set }
}
