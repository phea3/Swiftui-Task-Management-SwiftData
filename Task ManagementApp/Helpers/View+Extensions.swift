//
//  Date+Extensions.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 13/7/23.
//

import SwiftUI

/// Custom View Extension
extension View {
    ///Custom Spacers
    @ViewBuilder
    func hSpacing(_ alignment:Alignment)-> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}


