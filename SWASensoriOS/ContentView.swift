//
//  ContentView.swift
//  SWASensoriOS
//
//  Created by Thang Nguyen on 2/2/24.
//

import SwiftUI
import ReportingModule
import AMSModule

struct ContentView: View {
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
         
            AMSView()
                .tabItem {
                    Label("AMS", systemImage: "list.bullet")
                }
            ReportingServiceView()
                .tabItem {
                    Label("RS", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
