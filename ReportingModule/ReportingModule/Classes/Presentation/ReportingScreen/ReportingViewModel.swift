//
//  ReportingViewModel.swift
//  ReportingModule
//
//  Created by Thang Nguyen on 2/4/24.
//

import Foundation
import Combine
import CoreModule

extension Date {
    var timInMiliseconds: Int {
        Int(self.timeIntervalSince1970 * 1000)
    }
}
extension ReportingView {
    class ViewModel: ObservableObject {
        @Published var reports: [Report] = []
        @Published var reportGroups: [ReportGroup] = []
        @Published var topics: [String] = []
        @Published var dataSources: [String] = []
        @Published var selectedDataSource: String?
        @Published var loadingError: String = ""
        @Published var fromDate: Date = Date.init(timeIntervalSinceNow: -24*3600)
        @Published var toDate: Date = .now
        @Published var selectedTopic: String? = nil
        @Published var loading = false
        
        private var cancelableSet: Set<AnyCancellable> = []
        private let reportingService: ReportingServiceProtocol
        
        init(reportingService: ReportingServiceProtocol = ReportingService()) {
            self.reportingService = reportingService
            getTopics()
            
            $selectedTopic.sink { [weak self] topic in
                if let topic = topic {
                    print("selected Topic: \(topic)")
                    self?.getReports(topic,
                                     from: self?.fromDate.timInMiliseconds,
                                     to: self?.toDate.timInMiliseconds)
                    self?.selectedDataSource = nil
                }
            }
           .store(in: &cancelableSet)
            
            $selectedDataSource.sink {[weak self] dataSource in
                if let dataSource {
                    print("selected datasource: \(dataSource)")
                    self?.getReportByDataSource(dataSource,
                                               from: self?.fromDate.timInMiliseconds,
                                               to: self?.toDate.timInMiliseconds)
                    self?.selectedTopic = nil
                }
            }.store(in: &cancelableSet)
            
            $fromDate.sink { [weak self] date in
                if let topic = self?.selectedTopic {
                    self?.getReports(topic,
                                     from: self?.fromDate.timInMiliseconds,
                                     to: self?.toDate.timInMiliseconds)
                } else if let dataSource = self?.selectedDataSource {
                    self?.getReportByDataSource(dataSource,
                                               from: self?.fromDate.timInMiliseconds,
                                               to: self?.toDate.timInMiliseconds)
                }
                else {
                    self?.getReportByTopics(self?.topics ?? [],
                                               from: self?.fromDate.timInMiliseconds,
                                               to: self?.toDate.timInMiliseconds)
                }
            }.store(in: &cancelableSet)
        
            $toDate.sink { [weak self] date in
                if let topic = self?.selectedTopic {
                    self?.getReports(topic,
                                     from: self?.fromDate.timInMiliseconds,
                                     to: self?.toDate.timInMiliseconds)
                } else if let dataSource = self?.selectedDataSource {
                    self?.getReportByDataSource(dataSource,
                                               from: self?.fromDate.timInMiliseconds,
                                               to: self?.toDate.timInMiliseconds)
                } else {
                    self?.getReportByTopics(self?.topics ?? [],
                                               from: self?.fromDate.timInMiliseconds,
                                               to: self?.toDate.timInMiliseconds)
                }
            }.store(in: &cancelableSet)
        }
        
        private func getTopics() {
            let sharePublisher = reportingService.getTopicNames().share()
            sharePublisher.sink { completion in
            } receiveValue: { [weak self]names in
                print("topics: " , names)
                self?.topics = names
                self?.getReportByTopics(names,
                                        from: self?.fromDate.timInMiliseconds,
                                        to: self?.toDate.timInMiliseconds)
            }
            .store(in: &cancelableSet)
            
           
            sharePublisher.flatMap { array in
                array.publisher.setFailureType(to: NetworkError.self)
            }
            .flatMap { topic in
                topic.split(separator: "_").publisher.setFailureType(to: NetworkError.self)
            }
            .filter {!$0.contains("SS")}
            .map {String($0)}
            .removeDuplicates()
            .collect()
            .map {array in Set(array)}
            .map {set in Array(set)}
            .sink { completion in
                
            } receiveValue: { [weak self] value in
                print(value)
                self?.dataSources = value
            }
            .store(in: &cancelableSet)

        }
        
       private func getReports(_ topic: String, from: Int? = nil, to: Int? = nil) {
           self.loading = true
            reportingService.getReportsByTopic(name: topic, from: from, to: to)
                .sink { [weak self] completion in
                    self?.loading = false
                    print(completion)
                } receiveValue: { [weak self] reports in
                    self?.loading = false
                    self?.reports = reports
                    self?.reportGroups = []
                }.store(in: &cancelableSet)

        }
        
       private func getReportByDataSource(_ dataSource: String, from: Int? = nil, to: Int? = nil) {
           loading = true
            let topics = self.topics.filter {$0.contains(dataSource)}
            reportingService.getReportsByTopics(topics: topics, from: from, to: to).sink { [weak self] completion in
                self?.loading = false
            } receiveValue: {[weak self] reports in
                self?.loading = false
                self?.reportGroups = reports
                self?.reports = []
            }.store(in: &cancelableSet)

        }
        
        private func getReportByTopics(_ topics: [String], from: Int? = nil, to: Int? = nil) {
            loading = true
             reportingService.getReportsByTopics(topics: topics, from: from, to: to)
                .sink { [weak self ] completion in
                 self?.loading = false
             } receiveValue: {[weak self] reports in
                 self?.loading = false
                 self?.reportGroups = reports
                 self?.reports = []
             }.store(in: &cancelableSet)

         }
    }
}
