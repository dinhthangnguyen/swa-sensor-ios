//
//  AMSViewModel.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import NetworkCore
import Combine

extension AMSView {
    class ViewModel: ObservableObject {
        @Published var amsArray: [AMSData] = []
        @Published var loading: Bool = false
        @Published var alert: String?
        @Published var selectedService: AMSData?
        
        private var cancelableSet: Set<AnyCancellable> = []
        
        private let amsService: AMSServiceProtocol
        init(amsService: AMSServiceProtocol = AMSService()) {
            self.amsService = amsService
            getAllAPIs()
        }
        
        
        private func getAllAPIs() {
            self.loading = true
            amsService.getAllAPIs().sink {[weak self] completion in
                self?.loading = false
                if let error = completion.error {
                    self?.alert = error.localizedDescription
                }
                
            } receiveValue: { [weak self] array in
                self?.amsArray = array
                self?.loading = false
            }
            .store(in: &cancelableSet)
        }
    }
}
