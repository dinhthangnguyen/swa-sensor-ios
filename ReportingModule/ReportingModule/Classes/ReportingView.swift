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

    public init() {}
    public var body: some View {
        let topicBinding = Binding<String>(
            get: {viewModel.selectedTopic ?? ""}, 
            set: {viewModel.selectedTopic = $0}
        )
        
        let dataSourceBinding = Binding<String>(
            get: {viewModel.selectedDataSource ?? ""}, set: {viewModel.selectedDataSource = $0}
        )
        
        let fromDate = Binding<Date>(
            get: {viewModel.fromDate}, set: {viewModel.fromDate = $0}
        )
        
        let toDate = Binding<Date>(
            get: {viewModel.toDate}, set: {viewModel.toDate = $0}
        )
        
        NavigationStack {
            VStack {
                HStack(content: {
                    VStack {
                        DatePicker(selection: fromDate) {
                            Text("From Date")
                        }
                        DatePicker(selection: toDate) {
                            Text("To Date")
                        }
                    }
                    
                }).padding()
                Chart {
                    ForEach(viewModel.reports, id: \.id) { report in
                        LineMark(x: .value("Time", report.timestamp),
                                 y: .value("Value", report.value))
                        .foregroundStyle(by: .value("Data Source", report.dataSource))
                    }
                    
                    ForEach(viewModel.reportGroups, id: \.id) { reportGroup in
                        ForEach(reportGroup.data, id: \.id) { report in
                            LineMark(x: .value("Time", report.timestamp),
                                     y: .value("Value", report.value),
                                     series: .value("Topic", report.dataSource)
                            )
                            .foregroundStyle(reportGroup.color)
                        }
                    }
                }
            }
            
            .navigationTitle("Reporting Service")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Topics", selection: topicBinding) {
                            ForEach(viewModel.topics, id: \.self) { topic in
                                Text(topic).tag(topic)
                            }
                        }
                        .pickerStyle(.inline)
                    } label: {
                        Label("Topics", systemImage: "list.bullet.circle")
                    }
                }
                
                ToolbarItem {
                    Menu {
                        Picker("Data Source", selection: dataSourceBinding) {
                            ForEach(viewModel.dataSources, id: \.self) { source in
                                Text(source).tag(source)
                            }
                        }
                        .pickerStyle(.inline)
                    } label: {
                        Label("Data Source", systemImage: "pencil.and.list.clipboard")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Time", systemImage: "square.and.arrow.up") {
                        print("will pick time")
                    }
                }
             
            }
        }
        
    }
    
}

#Preview {
    ReportingView()
}
