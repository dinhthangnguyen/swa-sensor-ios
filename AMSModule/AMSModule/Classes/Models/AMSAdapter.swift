//
//  AMSAdapter.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation

class AMSAdapter {
    static func getAMS(amsDTO: AMSDataDTO) -> AMSData {
        AMSData(id: amsDTO.id ?? "",
                name: amsDTO.name ?? "",
                endpoint: amsDTO.endpoint ?? "",
                description: amsDTO.description ?? "",
                status: amsDTO.status ?? "")
    }
}
