//
//  AMSDataDTO.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation

struct AMSDataDTO : Codable {
    let id : String?
    let name : String?
    let endpoint : String?
    let description : String?
    let status : AMSStatus?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case endpoint = "endpoint"
        case description = "description"
        case status = "status"
    }

}
