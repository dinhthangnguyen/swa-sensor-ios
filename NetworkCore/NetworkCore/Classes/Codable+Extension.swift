//
//  Codable+Extension.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation

public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    func toParameters() -> [String: Any] {
        return dictionary ?? [:]
    }
}
