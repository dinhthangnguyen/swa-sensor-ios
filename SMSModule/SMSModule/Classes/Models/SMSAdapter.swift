//
//  SMSAdapter.swift
//  SMSModule
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
class SMSAdapter {
    static func getSMSData(data: SMSDataDTO) -> SMSData {
        SMSData(id: data.id ?? "",
                image: data.image ?? "",
                containerName: data.containerName ?? "",
                port: data.port ?? "")
    }
}
