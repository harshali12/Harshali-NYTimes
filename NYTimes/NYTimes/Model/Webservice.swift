//
//  Webservice.swift
//  NYTimes
//
//  Created by APPLE on 19/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import Foundation
import UIKit

//topstories/v2/science.json?api-key=0dtvmf1sj0nJHFh2ijAmwnkEDkUbKzaa
let kBaseURL = "https://api.nytimes.com/svc/"
let kTopStoryUrl = "topstories/v2/science.json?"
let api_key = "0dtvmf1sj0nJHFh2ijAmwnkEDkUbKzaa"
let kUrlEncoded = "application/x-www-form-urlencoded"
let kContentType = "Content-Type"

var count : Int?

class STWebService: NSObject {
    
    static let shared = STWebService()
    
    private override init() {
        super.init()
    }
    
    /**
     * This method returns URL
     * - Parameter token: String value
     * - Returns: url in string format
     */
    func getURL(_ url : String) -> String {
        let url = kBaseURL + url
        return url
    }
    
    /**
     * This method returns serviceURL
     * - Parameter token: Dictionary value
     * - Parameter token: String value
     * - Returns: serviceURL in URL format
     */
    func urlByAddingParamters(_ dict : [String : Any],_ serviceURL:String) -> URL {
        
        var elementsArray =  [String]()
        
        for key in dict.keys{
            let value = "\(key)=\(dict[key]!)"
            elementsArray.append(value)
        }
        
        var body = ""
        if dict.keys.count > 0 {
            body.append("?")
        }
        
        body.append(elementsArray.joined(separator: "&"))
        
        let url:URL = URL.init(string: serviceURL+body)!
        return url
        
    }
    
    /**
     * This method returns NSURLRequest
     * - Parameter token: URL value
     * - Returns: serviceURL in NSURLRequest format
     */
    func getRequest(url:URL) -> NSURLRequest {
        let urlRequest = NSMutableURLRequest(url: url as URL)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
    /**
     * This method returns URLRequest
     * - Parameter token: URL value
     * - Returns: serviceURL in URLRequest format
     */
    func postRequest(url:URL) -> URLRequest {
        let urlRequest = NSMutableURLRequest(url: url as URL)
        urlRequest.httpMethod = "POST"
        return urlRequest as URLRequest
    }
    
    /**
     * This method gives requestBody
     * - Parameter token: Dictionary value
     * - Returns: requestBody in Data format
     */
    func requestBodyFrom(details:[String:Any]) -> Data {
        
        var elementsArray =  [String]()
        for key in details.keys{
            let value = "\(key)=\(details[key]!)"
            elementsArray.append(value)
        }
        let body = elementsArray.joined(separator: "&")
        count = body.count
        let requestData = body.data(using: .utf8)
        
        return requestData!
    }
    
    /**
     * This method is used to get Request Data
     * - Parameter token: Dictionary value
     * - Returns: requestBody in Data format
     */
    func requestBodyForFormURLEncoded(details:[String:Any]) -> Data {
        
        var elementsArray =  [String]()
        for key in details.keys{
            let value = "\(key)=\(details[key]!)"
            elementsArray.append(value)
        }
        let body = elementsArray.joined(separator: "&")
        let requestData = body.data(using:String.Encoding.ascii)
        return requestData!
    }
    
    typealias CompletionHandler = (_ statusCode:Int, _ data:[String:Any]?, _ error:Error? ) -> Void
    
    /**
     * This method serialize responsed data for login service
     * - Parameter token: String value
     * - Parameter token: String value
     */
    
    func fetchNYTimesItems(completionHandler:@escaping CompletionHandler) {
        
        let getDomainURL = getURL(kTopStoryUrl)
        let url = URL(string: getDomainURL)
        var urlReqeust = postRequest(url: url!)
        urlReqeust.setValue(kUrlEncoded, forHTTPHeaderField: kContentType)
        
        let task = URLSession.shared.dataTask(with: urlReqeust as URLRequest, completionHandler: { responseData , response , error in
            var statusCode = 0
            if response != nil {
                let httpResponse = response as! HTTPURLResponse
                statusCode = httpResponse.statusCode
            }
            else {
                statusCode = 0
            }
            guard let data = responseData , let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                else {
                    DispatchQueue.main.async {
                        completionHandler(statusCode,nil,error)
                    }
                    return
            }
            DispatchQueue.main.async {
                completionHandler(statusCode,jsonData as? [String:Any],error)
            }
        })
        task.resume()
    }
    
//    func login(email:String, password:String,completionHandler:@escaping CompletionHandler) {
//
//        let parameters = [kEmail:email,kPassword:password]
//        let loginURL = getTestURL(kLoginPath)
//        let url = URL(string: loginURL)
//        var urlReqeust = postRequest(url: url!)
//        urlReqeust.httpBody = requestBodyFrom(details: parameters)
//
//
//        let task = URLSession.shared.dataTask(with: urlReqeust as URLRequest, completionHandler: { responseData , response , error in
//            var statusCode = 0
//
//            if response != nil {
//                let httpResponse = response as! HTTPURLResponse
//                statusCode = httpResponse.statusCode
//            }
//            else {
//                statusCode = 0
//            }
//
//            guard let data = responseData , let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
//                else {
//                    DispatchQueue.main.async {
//                        completionHandler(statusCode,nil,error)
//                    }
//                    return
//            }
//            DispatchQueue.main.async {
//                completionHandler(statusCode,jsonData as? [String:Any],error)
//            }
//        })
//        task.resume()
//    }
    

}
