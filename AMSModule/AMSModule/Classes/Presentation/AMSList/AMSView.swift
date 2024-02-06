//
//  AMSView.swift
//  AMSModule
//
//  Created by Thang Nguyen on 2/3/24.
//

import SwiftUI

public struct AMSView: View {
    @ObservedObject var viewModel = ViewModel()
    public init() {
        
    }
    public var body: some View {
        let binding: Binding<AMSData?> = Binding(get: {viewModel.selectedService}, set: {viewModel.selectedService = $0})
        NavigationStack {
            List(selection: binding) {
                ForEach(viewModel.amsArray) { ams in
                    AMSRow(ams: ams)
                }
            }
            .navigationTitle("SMS")
            .navigationBarTitleDisplayMode(.inline)
            .frame(minWidth: 300)
            
        }
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    SMSView()
                } label: {
                    Label("Add", systemImage: "add")
                }

                
            }
        }
        
    
    }
}

#Preview {
    AMSView()
}
