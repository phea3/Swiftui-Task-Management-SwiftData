//
//  ScannerView.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 18/7/23.
//

import SwiftUI

struct ScannerView: View {
    var body: some View {
        VStack(spacing: 8) {
            QRCodeScannerExampleView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(.cyan)
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
