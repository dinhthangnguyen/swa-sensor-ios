//
//  View+Extension.swift
//  NetworkCore
//
//  Created by Thang Nguyen on 2/7/24.
//

import SwiftUI

extension View {
    @ViewBuilder
   public func loadingView(_ loading: Bool) -> some View {
        if (loading) {
            VStack (alignment: .center) {
                Text("Loading...")
                    .foregroundStyle(.red)
                ProgressView()
                    .foregroundStyle(.gray)
            }
        }
    }
}
