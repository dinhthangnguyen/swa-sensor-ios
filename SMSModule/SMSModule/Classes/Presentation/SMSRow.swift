//
//  SMSRow.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/6/24.
//

import SwiftUI

struct SMSRow: View {
    var sms: SMSData
    var body: some View {
        VStack (alignment: .leading) {
            HStack  {
                Text(sms.containerName).bold().font(.system(size: 13))
                Spacer()
            }
            Spacer(minLength: 20)
            HStack {
                Text("Port: \(sms.port)").font(.system(size: 12))

                Spacer()
                Text(sms.image).font(.system(size: 10))

            }
        }
       
        
       
    }
}

#Preview {
    SMSRow(sms: SMSData(id: "1", image: "d", containerName: "Hello", port: "8080"))
}
