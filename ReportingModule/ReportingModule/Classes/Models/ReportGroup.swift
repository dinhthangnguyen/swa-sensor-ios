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
        case "SS_AGE_WEIGHT":
            color = .red
        case "SS_HEIGHT_WEIGHT":
            color = .green
        default:
            color = .blue
        }
    }
}

