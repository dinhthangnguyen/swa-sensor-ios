//
//  AMSData.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation

enum AMSStatus: String, CaseIterable, Identifiable, Codable, Hashable {
    var id: String {
        self.rawValue
    }
    case new = "NEW"
    case uncertain = "UNCERTAIN"
    case unavailable = "UNAVAILABLE"
    case free = "FREE"
}

struct AMSData: Hashable, Codable, Identifiable {
    var id : String
    var name : String
    var endpoint : String
    var description : String
    var status : AMSStatus
}
