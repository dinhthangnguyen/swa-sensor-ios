//
//  ReportingServiceView.swift
//  ReportingModule
//
//  Created by Thang Nguyen on 2/3/24.
//

import SwiftUI
import Charts

public struct ReportingView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var data1: [Report] = [
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 100, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 200, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 300, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 400, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 500, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 600, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 700, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 800, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 900, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1000, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1100, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1200, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1300, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1400, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1500, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1600, dataSource: "D1D2"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 100, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 200, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 300, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 400, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 500, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 600, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 700, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 800, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 900, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1000, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1100, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1200, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1300, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1400, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1500, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1600, dataSource: "D1D3"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 100, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 200, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 300, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 400, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 500, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 600, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 700, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 800, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 900, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1000, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1100, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1200, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1300, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1400, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1500, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1600, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1700, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1800, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 1900, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 2000, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 2100, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 2200, dataSource: "D1D4"),
        .init(id: UUID().uuidString, value: Double.random(in: 0...1), timestamp: 2300, dataSource: "D1D4"),


    ]
    
    var data2: [Report] = [
       
    ]
    
    public init() {
        
    }
    public var body: some View {
        NavigationView {
            VStack {
                ForEach(viewModel.topics, id: \.self) { report in
                    Text(report)
                }
                Chart {
                    ForEach(viewModel.reports, id: \.id) { report in
                        LineMark(x: .value("Time", report.timestamp),
                                 y: .value("Value", report.value))
                        .foregroundStyle(by: .value("Data Source", report.dataSource))
                    }
                    
                }
            }
          
            
            .navigationTitle("Reporting Service")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    ReportingView()
}
