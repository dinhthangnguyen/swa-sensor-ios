//
//  SMSData.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation

struct SMSData : Codable, Identifiable {
    let id : String
    let image : String
    let containerName : String
    let port : String
}
