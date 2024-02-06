//
//  SMSService.swift
//  SMSModule
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import Combine
import NetworkCore

protocol SMSServiceProtocol {
    func getRunningContainers() -> AnyPublisher<[SMSData], NetworkError>
}

class SMSService: SMSServiceProtocol {
    private let smsRepository: SMSRepositoryProtocol
    
    init(smsRepository: SMSRepositoryProtocol = SMSRepository()) {
        self.smsRepository = smsRepository
    }
    
    func getRunningContainers() -> AnyPublisher<[SMSData], NetworkError> {
        smsRepository.getRunningContainers()
            .map { $0.map {SMSAdapter.getSMSData(data: $0)}}
            .eraseToAnyPublisher()
    }
}
