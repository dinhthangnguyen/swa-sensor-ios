//
//  AMSRepository.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import Combine
import CoreModule
protocol AMSRepositoryProtocol {
    func getAllAPIs() -> AnyPublisher<[AMSDataDTO], NetworkError>
    func updateAPI(ams: AMSData) -> AnyPublisher<AMSDataDTO, NetworkError>
    func createAPI(ams: AMSData) -> AnyPublisher<AMSDataDTO,NetworkError>
}

class AMSRepository: AMSRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init (networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getAllAPIs() -> AnyPublisher<[AMSDataDTO], NetworkError> {
        networkService.request(endpoint: AMSEndpoint.getAllAPIs)
    }
    
    func updateAPI(ams: AMSData) -> AnyPublisher<AMSDataDTO, NetworkError> {
        networkService.request(endpoint: AMSEndpoint.updateAPI(ams: ams))
    }
    
    func createAPI(ams: AMSData) -> AnyPublisher<AMSDataDTO, NetworkError> {
        networkService.request(endpoint: AMSEndpoint.createAPI(ams: ams))
    }
    
    
}
