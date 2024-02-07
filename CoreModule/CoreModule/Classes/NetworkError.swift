//
//  NetworkError.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/4/24.
//

import Foundation

public enum NetworkError: Error {
    case unknown
    case wrapError(originalError: Error)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "Something went wrong"
        case let .wrapError(originalError: error):
            return error.localizedDescription
        }
    }
}
