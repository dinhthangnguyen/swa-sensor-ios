//
//  SMSView.swift
//  SMSModule
//
//  Created by Thang Nguyen on 2/3/24.
//

import SwiftUI

public struct SMSView: View {
    @ObservedObject var viewModel = ViewModel()
    
    public init() {
        
    }
    
    public var body: some View {
        let binding: Binding<SMSData?> = Binding(get: {viewModel.selectedService}, set: {viewModel.selectedService = $0})
        NavigationStack {
            ZStack {
                List(selection: binding) {
                    ForEach(viewModel.smsArray) { sms in
                        SMSRow(sms: sms)
                    }
                }
                loadingView(viewModel.loading)
            }
            .navigationTitle("SMS")
            .navigationBarTitleDisplayMode(.inline)
            .frame(minWidth: 300)
        }
        .onAppear {
            viewModel.getRunningContainers()
        }
    
    }
}

#Preview {
    SMSView()
}
