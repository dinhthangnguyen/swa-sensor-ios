//
//  AMSDetailView.swift
//  AMSModule
//
//  Created by Thang Nguyen on 2/6/24.
//

import SwiftUI

struct AMSDetailView: View {
    @ObservedObject private var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        let endpoint = Binding<String>(
            get: {viewModel.selectedAMSItem?.endpoint ?? ""},
            set: {viewModel.selectedAMSItem?.endpoint = $0}
        )
        
        let name = Binding<String>(
            get: {viewModel.selectedAMSItem?.name ?? ""},
            set: {viewModel.selectedAMSItem?.name = $0}
        )
        
        let description = Binding<String>(
            get: {viewModel.selectedAMSItem?.description ?? ""},
            set: {viewModel.selectedAMSItem?.description = $0}
        )
        
        let status = Binding<String>(
            get: {viewModel.selectedAMSItem?.status.rawValue ?? ""},
            set: {viewModel.selectedAMSItem?.status = AMSStatus(rawValue: $0) ?? .new}
        )
        
        NavigationStack {
            ZStack {
                List {
                    HStack {
                        TextField("Endpoint", text: endpoint)
                    }
                    HStack {
                        TextField("Name", text: name)
                    }
                    HStack {
                        TextField("Description", text: description)
                    }
                    HStack {
                        TextField("status", text: status)
                    }
                }
                
            }
            .navigationTitle(viewModel.isNew ? "Create API" : "Update API")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                       Text("Cancel")
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        if let selectedAMSItem = viewModel.selectedAMSItem {
                            viewModel.createAMS(amsItem: selectedAMSItem)
                        }
                    }, label: {
                        Text("Done")
                    })
                }
            }
            
        }
    
        
    }
}

#Preview {
    AMSDetailView(viewModel: AMSDetailView.ViewModel())
}
