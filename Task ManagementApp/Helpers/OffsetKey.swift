//
//  OffsetKey.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 29/7/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    static var defaultValue: CGFloat = 0
}

