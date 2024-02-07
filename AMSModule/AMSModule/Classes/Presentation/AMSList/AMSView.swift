//
//  AMSView.swift
//  AMSModule
//
//  Created by Thang Nguyen on 2/3/24.
//

import SwiftUI

public struct AMSView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var showing = false

    public init() {
        
    }
    
    var filteredArray: [AMSData] {
        if viewModel.selectedStatus == nil {
            return viewModel.amsArray
        }
        return viewModel.amsArray.filter {$0.status == viewModel.selectedStatus}
    }
    
    
    public var body: some View {
        let binding: Binding<AMSData?> = Binding(get: {viewModel.selectedService}, set: {viewModel.selectedService = $0})
        let status = Binding<String>(
            get: {viewModel.selectedStatus?.rawValue ?? "ALL"},
            set: {viewModel.selectedStatus = AMSStatus(rawValue: $0) }
        )
        
        
        NavigationStack {
            ZStack {
                VStack {
                    Picker("Select Status", selection: status) {
                        Text("ALL").tag("ALL")
                        ForEach(AMSStatus.allCases) { s in
                            Text(s.rawValue).tag(s)
                        }
                    }.pickerStyle(.segmented)
                       
                    List(selection: binding) {
                        ForEach(filteredArray) { ams in
                            NavigationLink {
                                AMSDetailView(viewModel: AMSDetailView.ViewModel(selectedAMSItem: ams))
                            } label: {
                                AMSRow(ams: ams)
                            }
                        }
                    }
                    .refreshable {
                        viewModel.getAllAPIs()
                    }
                }
                .onAppear {
                    print("hello AMS")
                    viewModel.getAllAPIs()
                }
             
                loadingView(viewModel.loading)
            }
            .navigationTitle("API Manager Service")
            .navigationBarTitleDisplayMode(.inline)
            .frame(minWidth: 300)
            .toolbar {
               
                ToolbarItem {
                    Button(action: {
                        showing.toggle()
                    }, label: {
                        Label("Add", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showing, onDismiss: {
                viewModel.getAllAPIs()
            }, content: {
                AMSDetailView(viewModel: AMSDetailView.ViewModel())
            })
        }
    
        
    
    }
}

#Preview {
    AMSView()
}
