//
//  Util.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import UIKit

class Utils{
    
    static func getDateFromString(_ dateString: String) -> String{
        
        //2018-11-19T19:05:23.000Z
        let enUSPosixLocale = Locale(identifier: "es_PE")
        let timeZone = TimeZone(identifier:"PET")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.timeZone = timeZone

        let dateFormartArticle = DateFormatter()
        dateFormartArticle.dateFormat = "dd/MM/yyyy HH:mm:ss"
        dateFormartArticle.locale = enUSPosixLocale
        dateFormartArticle.timeZone = timeZone
        
        if let date = dateFormatter.date(from: dateString) {
            print("FECHA CONVERTIDA: \(dateFormartArticle.string(from: date))")
            let strDate = dateFormartArticle.string(from: date)
            return (strDate)
        } else {
            print("There was an error decoding the string")
            return ("")
        }
    }
}

extension String{
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
