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
    let status : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case endpoint = "endpoint"
        case description = "description"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        endpoint = try values.decodeIfPresent(String.self, forKey: .endpoint)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}
