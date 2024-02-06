//
//  SWASensoriOSApp.swift
//  SWASensoriOS
//
//  Created by Thang Nguyen on 2/2/24.
//

import SwiftUI
import NetworkCore
@main
struct SWASensoriOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    DIContainer.shared.start()

                }
        }
    }
}
