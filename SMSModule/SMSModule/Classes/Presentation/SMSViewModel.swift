//
//  SMSViewModel.swift
//  SMSModule
//
//  Created by Thang Nguyen on 2/6/24.
//

import SwiftUI
import Combine
import CoreModule
extension SMSView {
    
    class ViewModel: ObservableObject {
        @Published var smsArray: [SMSData] = []
        @Published var loading: Bool = false
        @Published var alert: String?
        @Published var selectedService: SMSData?
        
        private var cancelableSet: Set<AnyCancellable> = []
        
        private let smsService: SMSServiceProtocol
        init(smsService: SMSServiceProtocol = SMSService()) {
            self.smsService = smsService
        }
        
        
        func getRunningContainers() {
            self.loading = true
            smsService.getRunningContainers().sink {[weak self] completion in
                self?.loading = false
                if let error = completion.error {
                    self?.alert = error.localizedDescription
                }
                
            } receiveValue: { [weak self] array in
                self?.smsArray = array
                self?.loading = false
            }
            .store(in: &cancelableSet)
        }
    }
}
