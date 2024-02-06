//
//  SMSDataDTO.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation

struct SMSDataDTO : Codable {
    let id : String?
    let image : String?
    let containerName : String?
    let port : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
        case containerName = "containerName"
        case port = "port"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        containerName = try values.decodeIfPresent(String.self, forKey: .containerName)
        port = try values.decodeIfPresent(String.self, forKey: .port)
    }

}
