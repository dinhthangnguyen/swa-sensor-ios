//
//  AMSDetailView.swift
//  AMSModule
//
//  Created by Thang Nguyen on 2/6/24.
//

import SwiftUI
import NetworkCore

struct AMSDetailView: View {
    @ObservedObject private var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
   @ViewBuilder
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
        
        let status = Binding<AMSStatus>(
            get: {viewModel.selectedAMSItem?.status ?? .new},
            set: {viewModel.selectedAMSItem?.status = $0 }
        )
        
        let showSuccess = Binding<Bool>(
            get: {viewModel.showSuccess},
            set: {viewModel.showSuccess = $0 }
        )
        
        NavigationStack {
            ZStack {
                List {
                    HStack {
                        Text("Name")
                        Spacer()
                        TextField("Name", text: name)
                            .multilineTextAlignment(.trailing)

                    }
                    HStack {
                        Text("Endpoint")
                        Spacer()
                        TextField("Endpoint", text: endpoint)
                            .multilineTextAlignment(.trailing)
                    }
                   
                    HStack {
                        Text("Description")
                        Spacer()
                        TextField("Description", text: description)
                            .multilineTextAlignment(.trailing)
                    }
                    Picker("Status", selection: status) {
                        ForEach(AMSStatus.allCases) { s in
                            Text(s.rawValue).tag(s)
                        }
                    }
                }
                loadingView(viewModel.loading)
            }
            .navigationTitle(viewModel.isNew ? "Create API" : "Update API")
            .toolbar {
                if (viewModel.isNew) {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                           Text("Cancel")
                        })
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        guard let selectedAMSItem = viewModel.selectedAMSItem else {return}
                        
                        if viewModel.isNew {
                            viewModel.createAMS(amsItem: selectedAMSItem)
                        } else {
                            viewModel.updateAMI(amsItem: selectedAMSItem)
                        }
                       
                    }, label: {
                        Text("Submit")
                    })
                }
                
            }
            
        }
        .alert("Successfull", isPresented: showSuccess, actions: {
            Button("OK", role: .cancel) { dismiss() }

        }, message: {
            Text("Update/Create successfully")
        })
    }
}

#Preview {
    AMSDetailView(viewModel: AMSDetailView.ViewModel())
}
