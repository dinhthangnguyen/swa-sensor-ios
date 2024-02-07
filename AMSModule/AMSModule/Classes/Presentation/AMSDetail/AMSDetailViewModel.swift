//
//  AMSDetailViewModel.swift
//  AMSModule
//
//  Created by Thang Nguyen on 2/6/24.
//

import SwiftUI
import Combine

extension AMSDetailView {
    class ViewModel: ObservableObject {
        @Published var selectedAMSItem: AMSData?
        @Published var loading: Bool = false
        @Published var showError: String?
        @Published var isNew: Bool = false
         var cancellableSet: Set<AnyCancellable> = []
        private let amsService: AMSServiceProtocol
        
        init(selectedAMSItem: AMSData? = nil, amsService: AMSServiceProtocol = AMSService()) {
            isNew = selectedAMSItem == nil
            if let selectedAMSItem {
                self.selectedAMSItem = selectedAMSItem
            } else {
                self.selectedAMSItem = AMSData(id: "", name: "", endpoint: "", description: "", status: .new)
            }
            self.amsService = amsService
        }
        
        func createAMS(amsItem: AMSData) {
            print("createAMS: \(amsItem)")
            self.loading = true
            amsService.createAPI(ams: amsItem).sink { [weak self] completion in
                if let error = completion.error {
                    print("amsERROR: " + error.localizedDescription)
                    self?.showError = error.localizedDescription
                }
                self?.loading = false
            } receiveValue: { [weak self] data in
                print("success \(data)" )
            }.store(in: &cancellableSet)
        }
        
        func updateAMI(amsItem: AMSData) {
            amsService.updateAPI(ams: amsItem).sink { [weak self] completion in
                if let error = completion.error {
                    self?.showError = error.localizedDescription
                }
            } receiveValue: { [weak self] data in
                print("success \(data)" )
            }.store(in: &cancellableSet)
        }
        
    }
}
