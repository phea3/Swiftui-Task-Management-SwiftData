//
//  QRScanner.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 18/7/23.
//

import SwiftUI
import UIKit
import SwiftQRCodeScanner

struct QRCodeScannerExampleView: View {
    @State private var isPresented = false
       @State private var result: Result<String, QRCodeError>?

    var body: some View {
        VStack(spacing: 30) {
        if let unwrappedResult = result {
            switch unwrappedResult {
            case .success(let qrCodeString):
                Text(qrCodeString)
            case .failure(let qrCodeError):
                Text(qrCodeError.errorDescription ?? "")
                    .foregroundColor(.red)
            }
        }
        Button("Scan QR Code") {
            self.isPresented = true
        }
    }
    .sheet(isPresented: $isPresented) {
        QRScanner(result: self.$result)
    }
    }
}



struct QRScanner: UIViewControllerRepresentable {
    @Binding var result: Result<String, QRCodeError>?
    @Environment(\.presentationMode) var presentationMode
    
    func makeCoordinator() -> QRScanner.Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> QRCodeScannerController {
        let picker = QRCodeScannerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: QRCodeScannerController, context: Context) {
        
    }
}

extension QRScanner {
    class Coordinator: NSObject, QRScannerCodeDelegate {
        var parent: QRScanner
        @Environment(\.presentationMode) var presentationMode
        
        init(_ parent: QRScanner) {
            self.parent = parent
        }
        
        func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
            parent.result = .success(result)
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func qrScannerDidFail(_ controller: UIViewController, error: SwiftQRCodeScanner.QRCodeError) {
            parent.result = .failure(error)
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func qrScannerDidCancel(_ controller: UIViewController) {
            print("QR Controller did cancel")
        }
    }
}
