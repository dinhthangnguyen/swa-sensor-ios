//
//  AMSRow.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/6/24.
//

import Foundation
import SwiftUI

struct AMSRow: View {
    var ams: AMSData
    var body: some View {
        VStack (alignment: .leading) {
            HStack  {
                Text(ams.endpoint).bold().font(.system(size: 13))
                Spacer()
                Text(ams.status.rawValue).font(.system(size: 12))
            }
            Spacer(minLength: 20)
            HStack {
                Text("Name: \(ams.name)").font(.system(size: 12))

                Spacer()
                Text(ams.description).font(.system(size: 10))

            }
        }       
    }
}

#Preview {
    AMSRow(ams: AMSData(id: "1", name: "hello", endpoint: "dadf", description: "adf", status: .new))
}
