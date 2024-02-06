//
//  DI.swift
//  SWASensoriOS
//
//  Created by Thang Nguyen on 2/4/24.
//

import Foundation
import NetworkCore
import ReportingModule
import Swinject

extension Container {
    func start() {
        register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }
        
        
    }
}
