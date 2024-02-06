//
//  AMSEndpoint.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import NetworkCore
import Alamofire

enum AMSEndpoint {
    case getAllAPIs
    case updateAPI(ams: AMSData)
    case createAPI(ams: AMSData)
}

extension AMSEndpoint: NetworkEndpointProtocol {
    var parameters: [String : Any]? {
        nil
    }
    
    var header: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:8787") else {
            fatalError("Please provide correct URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getAllAPIs:
            return "/apis"
        case let .updateAPI(amsDTO):
            return "/apis/\(amsDTO.id)"
        case let .createAPI(amsDTO):
            return "/apis"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllAPIs:
            return .get
        case let .updateAPI(amsDTO):
            return .put
        case let .createAPI(amsDTO):
            return .post
        }
    }
    
    public var encoding: ParameterEncoding {
        switch self {
        case .getAllAPIs:
            return JSONArrayEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
