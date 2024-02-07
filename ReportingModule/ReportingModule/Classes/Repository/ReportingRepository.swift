//
//  ReportingRepository.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/4/24.
//

import Combine
import CoreModule


protocol ReportingRepositoryProtocol {
    func getTopicNames() -> AnyPublisher<[String], NetworkError>
    func getReportsByTopic(name: String, from: Int?, to: Int?) -> AnyPublisher<ReportResponseDTO, NetworkError>
    func getReportsByTopics(topics: [String], from: Int?, to: Int?) -> AnyPublisher<[ReportResponseDTO], NetworkError>
}

final class ReportingRepository: ReportingRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    public init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getTopicNames() -> AnyPublisher<[String], NetworkError> {
        networkService.request(endpoint: ReportingEndpoint.getTopicNames)
    }
    
    func getReportsByTopic(name: String, from: Int?, to: Int?) -> AnyPublisher<ReportResponseDTO, NetworkError> {
        networkService.request(endpoint: ReportingEndpoint.getReportsByTopic(topicName: name, from: from, to: to))
    }
    
    func getReportsByTopics(topics: [String], from: Int?, to: Int?) -> AnyPublisher<[ReportResponseDTO], NetworkError> {
        networkService.request(endpoint: ReportingEndpoint.getReportsByTopics(topics: topics, from: from, to: to))
    }
}
