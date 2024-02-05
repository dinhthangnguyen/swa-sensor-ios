//
//  ContentView.swift
//  SWASensoriOS
//
//  Created by Thang Nguyen on 2/2/24.
//

import SwiftUI
import ReportingModule
import AMSModule
import SMSModule

struct ContentView: View {
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
         
            AMSView()
                .tabItem {
                    Label("API Manager Service", systemImage: "checklist")
                }
            SMSView()
                .tabItem {
                    Label("Service Manager Service", systemImage: "point.3.filled.connected.trianglepath.dotted")
                }
            ReportingView()
                .tabItem {
                    Label("Reporting Service", systemImage: "chart.xyaxis.line")
                }
        }
    }
}

#Preview {
    ContentView()
}
