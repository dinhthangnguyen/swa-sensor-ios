//
//  SMSEndpoint.swift
//  SMSModule
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import CoreModule
import Alamofire
enum SMSEndpoint {
    case getRunningContainers
}

extension SMSEndpoint: NetworkEndpointProtocol {
    var baseURL: URL {
        guard let url = URL(string: "https://cs590priusreportservice.azurewebsites.net") else {
            fatalError("Please provide correct URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getRunningContainers:
            return "/all-running-services"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        .get
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
    var header: [String : String]? {
        nil
    }
    
    public var encoding: ParameterEncoding {
        switch self {
        case .getRunningContainers:
            return JSONArrayEncoding.default
        }
    }
}
