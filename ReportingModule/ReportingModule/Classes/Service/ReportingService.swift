
//
//  ReportingService.swift
//  Alamofire
//
//  Created by Thang Nguyen on 2/4/24.
//

import Combine
import NetworkCore
 protocol ReportingServiceProtocol {
    func getTopicNames() -> AnyPublisher<[String], NetworkError>
    func getReportsByTopic(name: String, from: Int?, to: Int?) -> AnyPublisher<[Report], NetworkError>
    func getReportsByTopics(topics: [String], from: Int?, to: Int?) -> AnyPublisher<[ReportGroup], NetworkError>

}

class ReportingService: ReportingServiceProtocol {
    private let reportingRepository: ReportingRepositoryProtocol
    
    init(reportingRepository: ReportingRepositoryProtocol = ReportingRepository()) {
        self.reportingRepository = reportingRepository;
    }
    
    func getTopicNames() -> AnyPublisher<[String], NetworkError> {
        return reportingRepository.getTopicNames()
    }
    
    func getReportsByTopic(name: String, from: Int?, to: Int?) -> AnyPublisher<[Report], NetworkError> {
        return reportingRepository.getReportsByTopic(name: name,
                                                     from: from,
                                                     to: to)
        .map {ReportAdapter.getReports(reportResponse: $0)}
        .eraseToAnyPublisher()
    }
    
    func getReportsByTopics(topics: [String], from: Int?, to: Int?) -> AnyPublisher<[ReportGroup], NetworkError> {
        return reportingRepository.getReportsByTopics(topics: topics, from: from, to: to)
            .map {$0.map {ReportAdapter.getReportGroup(reportResponse: $0)}}
            .eraseToAnyPublisher()

    }

    
}
