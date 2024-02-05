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
                      timestamp: reportDTO.timestamp ?? 0,
                      dataSource: dataSource)
    }
    
    static func getReports(reportResponse: ReportResponseDTO) -> [Report] {
        let dataSource = reportResponse.topicName ?? ""
        
        let reports = (reportResponse.data ?? []).map { data in
            return getReport(reportDTO: data, dataSource: dataSource)
        }
        
        return reports
    }
}
