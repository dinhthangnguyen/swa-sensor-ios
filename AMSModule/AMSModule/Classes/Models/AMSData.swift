//
//  AMSData.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation

struct AMSData: Hashable, Codable, Identifiable {
    let id : String
    let name : String
    let endpoint : String
    let description : String
    let status : String
}
