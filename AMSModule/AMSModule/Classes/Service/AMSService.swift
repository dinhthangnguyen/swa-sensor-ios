//
//  AMSService.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import Combine
import CoreModule

protocol AMSServiceProtocol {
    func getAllAPIs() -> AnyPublisher<[AMSData], NetworkError>
    func updateAPI(ams: AMSData) -> AnyPublisher<AMSData, NetworkError>
    func createAPI(ams: AMSData) -> AnyPublisher<AMSData, NetworkError>
}

class AMSService: AMSServiceProtocol {
   
    private let amsRepository: AMSRepositoryProtocol
    
    init(amsRepository: AMSRepositoryProtocol = AMSRepository()) {
        self.amsRepository = amsRepository
    }
    
    func getAllAPIs() -> AnyPublisher<[AMSData], NetworkError> {
        amsRepository.getAllAPIs()
            .map { $0.map {AMSAdapter.getAMS(amsDTO: $0)}}
            .eraseToAnyPublisher()
    }
    
    func createAPI(ams: AMSData) -> AnyPublisher<AMSData, NetworkError> {
        amsRepository.createAPI(ams: ams)
            .map {AMSAdapter.getAMS(amsDTO: $0)}
            .eraseToAnyPublisher()
    }
    
    func updateAPI(ams: AMSData) -> AnyPublisher<AMSData, NetworkError> {
        amsRepository.updateAPI(ams: ams)
            .map {AMSAdapter.getAMS(amsDTO: $0)}
            .eraseToAnyPublisher()
    }
    
}
