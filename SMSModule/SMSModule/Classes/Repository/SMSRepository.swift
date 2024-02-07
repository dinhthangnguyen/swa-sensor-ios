//
//  SMSRepository.swift
//  SMSModule
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import Combine
import CoreModule

protocol SMSRepositoryProtocol {
    func getRunningContainers() -> AnyPublisher<[SMSDataDTO], NetworkError>
}

class SMSRepository: SMSRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getRunningContainers() -> AnyPublisher<[SMSDataDTO], NetworkError> {
        networkService.request(endpoint: SMSEndpoint.getRunningContainers)
    }
}
