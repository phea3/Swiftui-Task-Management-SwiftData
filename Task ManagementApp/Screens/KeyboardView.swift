//
//  KeyboardView.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 15/7/23.
//

import SwiftUI

struct KeyboardView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack{
            HeaderView()
            BodyView()
            VStack{
                HStack(spacing: 0){
                    VStack{
                        
                    }
                    .frame(width: 12, height: 100)
                    .background(RoundedCorners(tl: 10, tr: 0, bl: 10, br: 0).fill(Color("bc2")))
                        
                    VStack{
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(RoundedCorners(tl: 0, tr: 10, bl: 0, br: 10).fill(Color("white")))
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("body"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            HStack{
                Image(systemName: "chevron.left")
                Text("VBV")
            }
            .foregroundColor(.white)
            .fontWeight(.bold)
        })
    }
    @ViewBuilder
    func HeaderView()->some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("")
        }
        .hSpacing(.leading)
        .background(Color("hc"))
    }
    @ViewBuilder
    func BodyView()->some View {
        VStack{
            HStack(alignment: .center,spacing: 0){
                Circle()
                    .stroke(Color("bc2"), lineWidth: 20)
                    .frame(width: 100, height: 100)
                    .overlay(alignment: .center) {
                        Text("Total")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                VStack(alignment: .leading){
                    Text("Total in US")
                        .foregroundColor(.gray)
                        .padding(.leading, 30)
                    Rectangle()
                        .fill(Color("bc2"))
                        .frame(height: 1)
                    Text("$ 1,234,232.32")
                        .font(.system(size: 20).bold())
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                }
            }
            .padding(.vertical, 30)
            .padding(.leading, 30)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(Color("bc"))
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()

        return path
    }
}
