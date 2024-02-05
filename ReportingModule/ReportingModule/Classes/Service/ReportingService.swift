
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
}

class ReportingService: ReportingServiceProtocol {
    private let reportingRepository: ReportingRepositoryProtocol
    
    init(reportingRepository: ReportingRepositoryProtocol = ReportingRepository()) {
        self.reportingRepository = reportingRepository;
    }
    
    public func getTopicNames() -> AnyPublisher<[String], NetworkError> {
        return reportingRepository.getTopicNames()
    }
    
    public func getReportsByTopic(name: String, from: Int?, to: Int?) -> AnyPublisher<[Report], NetworkError> {
        return reportingRepository.getReportsByTopic(name: name,
                                                     from: from,
                                                     to: to)
        .map {ReportAdapter.getReports(reportResponse: $0)}
        .eraseToAnyPublisher()
    }
    
}
