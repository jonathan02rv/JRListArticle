//
//  TimberjackHelper.swift
//  JRListArticle
//
//  Created by Jhonatahan on 10/17/20.
//

import Foundation

public enum Style {
    case verbose
    case light
}

open class TimberjackHelper: URLProtocol{
    
    
    public static var logStyle: Style = .verbose
    
    //MARK: - Log
    
    public class func debugPrint(s:String) {
         
         let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
         let documentsDirectory = paths[0]
         let formatter = DateFormatter()
         formatter.dateFormat = "dd-MM-yyyy"
         let dateString = formatter.string(from: Date())
         let fileName = "\(dateString).log"
         let logFilePath = (documentsDirectory as NSString).appendingPathComponent(fileName)
         var dump = ""
         if FileManager.default.fileExists(atPath: logFilePath) {
             dump =  try! String(contentsOfFile: logFilePath, encoding: String.Encoding.utf8)
         }
         do {
             // Write to the file
             try  "\(dump)\n\(Date()):\(s)".write(toFile: logFilePath, atomically: true, encoding: String.Encoding.utf8)
             
         } catch let error as NSError {
             print("Failed writing to log file: \(logFilePath), Error: " + error.localizedDescription)
         }
     }
    
    class func logDivider() {
        print("---------------------")
        TimberjackHelper.debugPrint(s: "---------------------")
    }
    
    class open func logRequest(_ request: URLRequest) {
         TimberjackHelper.logDivider()
        
        if let url = request.url?.absoluteString {
            print("Request: \(request.httpMethod!) \(url)")
            TimberjackHelper.debugPrint(s: "Request: \(request.httpMethod!) \(url)")
        }
        
        if TimberjackHelper.logStyle == .verbose {
            if let headers = request.allHTTPHeaderFields {
                self.logHeaders(headers as [String : AnyObject])
            }
        }
    }
    
    class func logHeaders(_ headers: [String: AnyObject]) {
        print("Headers: [")
        TimberjackHelper.debugPrint(s: "Headers: [")
        for (key, value) in headers {
            print("  \(key) : \(value)")
        TimberjackHelper.debugPrint(s: "\(key) : \(value)")
        }
    }
    
    class func logBody(_newRequest:URLRequest){
        
        DispatchQueue.global(qos: .background).async {
            
            TimberjackHelper.logRequest(_newRequest)
            print("====================")
            TimberjackHelper.debugPrint(s:"====================")
            print("BODY")
            TimberjackHelper.debugPrint(s:"BODY")
            
            if(_newRequest.httpBody != nil){
                let body = String(data: (_newRequest.httpBody)!, encoding:String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
                print(body)
                TimberjackHelper.debugPrint(s: body)
            }
        }
    }
}
