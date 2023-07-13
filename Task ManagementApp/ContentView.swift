//
//  ContentView.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 13/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bc"))
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
