//
//  ReportAdapter.swift
//  ReportingModule
//
//  Created by Thang Nguyen on 2/4/24.
//

import Foundation

final class ReportAdapter {
    static func getReport(reportDTO: ReportDTO, dataSource: String) -> Report {
        return Report(id: reportDTO.id ?? "",
                      value: reportDTO.value ?? 0,
                      timestamp: Date(timeIntervalSince1970: Double(reportDTO.timestamp ?? 0) / 1000.0),
                      dataSource: dataSource)
    }
    
    static func getReports(reportResponse: ReportResponseDTO) -> [Report] {
        let dataSource = reportResponse.topicName ?? ""
        
        let reports = (reportResponse.data ?? []).map { data in
            return getReport(reportDTO: data, dataSource: dataSource)
        }
        
        return reports
    }
    
    static func getReportGroup(reportResponse: ReportResponseDTO) -> ReportGroup {
        let dataSource = reportResponse.topicName ?? ""
        
        let reports = (reportResponse.data ?? []).map { data in
            return getReport(reportDTO: data, dataSource: dataSource)
        }
        
        return ReportGroup(id: dataSource, data: reports)
    }
}
