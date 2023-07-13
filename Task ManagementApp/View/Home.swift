//
//  Home.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 13/7/23.
//

import SwiftUI

struct Home: View {
    @State private var currentDate: Date = .init()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
        }
        .vSpacing(.top)
    }
    
    /// Header View
    @ViewBuilder
    func HeaderView()->some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundColor(Color("white"))
                Text(currentDate.format("YYYY"))
                    .foregroundColor(Color("white"))
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color("white"))
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing, content: {
            Button {
                
            } label: {
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:45, height: 45)
                    .clipShape(Circle())
            }

        })
        .padding(15)
        .background(Color("hc"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
