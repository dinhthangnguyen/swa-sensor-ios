//
//  NetworkEndpoint.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/4/24.
//

import Alamofire
import UIKit
public protocol NetworkEndpointProtocol {
    var baseURL: URL {get}
    var path: String {get}
    var method: Alamofire.HTTPMethod {get}
    var parameters: [String: Any]? {get}
    var header: [String: String]? {get}
    var encoding: ParameterEncoding {get}
    var maxRetry: Int {get}
    var fullURL: String {get}
}

public extension NetworkEndpointProtocol {
    var maxRetry: Int {
        1
    }
    var encoding: ParameterEncoding {
        JSONEncoding.default
    }
    var fullURL: String {
        return baseURL.appendingPathComponent(path).absoluteString
    }
    
    
}
