//
//  ReportGroup.swift
//  ReportingModule
//
//  Created by Thang Nguyen on 2/5/24.
//

import Foundation
import SwiftUI

struct ReportGroup : Identifiable {
   let id : String
   let data : [Report]
    let color: Color
    init(id: String, data: [Report]) {
        self.id = id
        self.data = data
        switch id {
        case "SS_Api-WEIGHT_Api-HEIGHT":
            color = .red
        case "SS_Api-AGE_Api-HEIGHT":
            color = .green
        case "SS_VaccineX_COVID19":
            color = .orange
        case "SS_Moderna_COVID19":
            color = .purple
        case "SS_Pfizer-BioNTech_COVID19":
            color = .yellow
        default:
            color = .blue
        }
    }
}

