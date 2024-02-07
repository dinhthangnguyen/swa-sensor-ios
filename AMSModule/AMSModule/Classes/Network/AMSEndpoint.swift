//
//  AMSEndpoint.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import CoreModule
import Alamofire

enum AMSEndpoint {
    case getAllAPIs
    case updateAPI(ams: AMSData)
    case createAPI(ams: AMSData)
    case deleteAMS(id: String)
}

extension AMSEndpoint: NetworkEndpointProtocol {
    var parameters: [String : Any]? {
        switch self {
        case let  .createAPI(ams):
            return ams.toParameters()
        case let .updateAPI(ams):
            return ams.toParameters()
        default:
            return nil
        }
    }
    
    var header: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://cs590priusreportservice.azurewebsites.net/api") else {
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
        case .createAPI:
            return "/apis"
        case let .deleteAMS(id):
            return "/apis/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllAPIs:
            return .get
        case .updateAPI:
            return .put
        case .createAPI:
            return .post
        case .deleteAMS:
            return .delete
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
