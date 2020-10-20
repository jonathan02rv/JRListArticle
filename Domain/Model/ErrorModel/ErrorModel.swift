//
//  ErrorResponse.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

public enum ResponseType: String {
    // Internal errors
    case unknownError
    case networkError
    case custom
}

public class ErrorModel: Error{
    public var type: ResponseType?
    public var description: String?
    
    public init(type: ResponseType?, description: String?) {
        self.type = type
        self.description = description
    }
}
