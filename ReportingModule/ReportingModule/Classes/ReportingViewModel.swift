//
//  ReportingViewModel.swift
//  ReportingModule
//
//  Created by Thang Nguyen on 2/4/24.
//

import Foundation
import Combine

extension ReportingView {
    class ViewModel: ObservableObject {
        @Published var reports: [Report] = []
        @Published var topics: [String] = []
        @Published var loadingError: String = ""
        @Published var showAlert: Bool = false
        private var cancelableSet: Set<AnyCancellable> = []
        private let reportingService: ReportingServiceProtocol
        
        init(reportingService: ReportingServiceProtocol = ReportingService()) {
            self.reportingService = reportingService
            getTopics()
            getReports("SS_2_1")
        }
        
        func getTopics() {
            reportingService.getTopicNames().sink { completion in
            } receiveValue: { [weak self]names in
                print("topics: " , names)
                self?.topics = names
            }
            .store(in: &cancelableSet)

        }
        func getReports(_ topic: String, from: Int? = nil, to: Int? = nil) {
            reportingService.getReportsByTopic(name: topic, from: from, to: to)
                .sink { completion in
                    print(completion)
                } receiveValue: { [weak self] reports in
                    print("reports: " ,reports)
                    self?.reports = reports
                }.store(in: &cancelableSet)

        }
    }
}
