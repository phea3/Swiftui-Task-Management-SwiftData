//
//  Home.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 13/7/23.
//

import SwiftUI
import LocalAuthentication

struct Home: View {
    @State private var currentDate: Date = .init()
    @State private var isUnlocked = false
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                HeaderView()
                
                VStack(spacing: 0){
                    VStack(spacing: 0){
                        HStack(spacing: 10){
                            Button {
                                authenticate()
                            } label: {
                                boxItems(IconName: "video")
                            }
                            
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, Color("bc")]), startPoint: .bottom, endPoint: .top))
                                .frame(width: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            boxItems(IconName: "mic")
                            
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, Color("bc")]), startPoint: .bottom, endPoint: .top))
                                .frame(width: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            boxItems(IconName: "tv.music.note")
                        }
                        
                        HStack(spacing: 0){
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, Color("bc")]), startPoint: .trailing, endPoint: .leading))
                                .frame(height: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, Color("bc")]), startPoint: .leading, endPoint: .trailing))
                                .frame(height: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                        }
                        
                        HStack(spacing: 10) {
                            
                            boxItems(IconName: "headphones")
                            
                            Rectangle()
                                .fill(.white)
                                .frame(width: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            boxItems(IconName: "desktopcomputer")
                            
                            Rectangle()
                                .fill(.white)
                                .frame(width: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            boxItems(IconName: "tv.fill")
                            
                        }
                        
                        HStack(spacing: 0){
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, Color("bc")]), startPoint: .trailing, endPoint: .leading))
                                .frame(height: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, Color("bc")]), startPoint: .leading, endPoint: .trailing))
                                .frame(height: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                        }
                        
                        HStack(spacing: 10){
                            
                            NavigationLink {
                                ScannerView()
                            } label: {
                                boxItems(IconName: "printer.fill")
                            }
                            
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, Color("bc")]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            
                            boxItems(IconName: "hifispeaker.fill")
                            
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .white, Color("bc")]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 1.0)
                                .gridCellUnsizedAxes(.horizontal)
                            NavigationLink {
                                Hometown()
                            } label: {
                                boxItems(IconName: "keyboard")
                            }
                           
                        }
                        
                    }
                    .padding(.top)
                    
                    VStack{
                        Image(systemName: "tornado.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                            .frame(height: 160, alignment: .trailing)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("bc2"))
                    
                    VStack{
                        Image(systemName: "snowflake.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                            .frame(height: 140, alignment: .trailing)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("bc3"))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color("bc"))
                
                
            }
            .vSpacing(.top)
            .navigationDestination(isPresented: $isUnlocked) {
               KeyboardView()
                
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    self.isUnlocked = true
                } else {
                    // there was a problem
                    self.isUnlocked = false
                }
            }
        } else {
            // no biometrics
        }
    }
    
    @ViewBuilder
    func boxItems(IconName: String)-> some View {
        VStack{
            Image(systemName: IconName)
                .foregroundColor(.white)
                .font(.system(size: 40))
                .frame(width: 40, height: 40, alignment: .center)
            
            Text(IconName)
                .foregroundColor(.white)
                .font(.system(size: 13).bold())
                .padding(.top,10)
        }
        .frame(width: 120, height: 140, alignment: .center)
    }
    /// Header View
    @ViewBuilder
    
    func HeaderView()->some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
//                Text(currentDate.format("MMMM"))
//                    .foregroundColor(Color("white"))
//                Text(currentDate.format("YYYY"))
//                    .foregroundColor(Color("white"))
                Text("$ 1,528,712.89")
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
                Image("phoem")
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
        ContentView()
    }
}
