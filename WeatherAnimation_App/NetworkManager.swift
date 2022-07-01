//
//  NetworkManager.swift
//  WeatherAnimation_App
//
//  Created by Felix Titov on 7/2/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

enum APIResult<T> {
    case success(T)
    case failure(Error)
}

protocol NetworkManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTask(with request: URLRequest, completionHandler: @escaping JSONCompletionHandler) -> JSONTask
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void)
}

extension NetworkManager {
    func JSONTask(with request: URLRequest, completionHandler: @escaping JSONCompletionHandler) -> JSONTask {
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let userInfo = [NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(
                    domain: theNetworkinfError,
                    code: missingHTTPResponseError, userInfo: userInfo
                )
                
                completionHandler(nil, nil, error)
                
                return
            }
            
            if data == nil {
                if let error = error {
                    completionHandler(nil, httpResponse, error)
                } else {
                    switch httpResponse.statusCode {
                    case 200:
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                            completionHandler(json, httpResponse, nil)
                        } catch let error as NSError {
                            print(error.localizedDescription)
                            completionHandler(nil, httpResponse, error)
                        }
                    default:
                        print("\(httpResponse.statusCode)")
                    }
                }
            }
        }
        
        return dataTask
    }
    
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void) {
        let dataTask = JSONTask(with: request) { json, response, error in
            guard let json = json else {
                if let error = error {
                    completionHandler(.failure(error))
                }
                return
            }
            
            if let value = parse(json) {
                completionHandler(.success(value))
                
            } else {
                let error = NSError(domain: theNetworkinfError, code: unexpectedResponseError, userInfo: nil)
                completionHandler(.failure(error))
            }
        }
        dataTask.resume()
    }
}
