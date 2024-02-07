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
    public var body: some View {
        let binding: Binding<AMSData?> = Binding(get: {viewModel.selectedService}, set: {viewModel.selectedService = $0})
        NavigationStack {
            List(selection: binding) {
                ForEach(viewModel.amsArray) { ams in
                    NavigationLink {
                        AMSDetailView(viewModel: AMSDetailView.ViewModel(selectedAMSItem: ams))
                    } label: {
                        AMSRow(ams: ams)
                    }
                }
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
