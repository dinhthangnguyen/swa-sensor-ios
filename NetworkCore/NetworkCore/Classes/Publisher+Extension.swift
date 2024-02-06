//
//  Publisher+Extension.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/6/24.
//

import Combine
public extension Subscribers.Completion {
    var error: Error? {
        switch self {
        case .failure(let error):
            return error
        case .finished:
            return nil
        }
    }
}
