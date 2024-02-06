//
//  NBArrayEncoding.swift
//  DACore
//
//  Created by ThangNguyen on 28/11/2022.
//  Copyright © 2022 DA Adept. All rights reserved.
//

import Foundation
import Alamofire

public struct JSONArrayEncoding: ParameterEncoding {
    public static let `default` = JSONArrayEncoding()

    public func encode(_ urlRequest: Alamofire.URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        guard let json = parameters?["jsonArray"] else {
            return request
        }
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        request.httpBody = data

        return request
    }
}
