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

protocol NetworkManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    init(sessionConfiguration: URLSessionConfiguration)
    func JSONTask(with request: URLRequest, completionHandler: JSONCompletionHandler) -> JSONTask
}
