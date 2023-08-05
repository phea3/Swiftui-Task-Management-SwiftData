//
//  NewTaskView.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 2/8/23.
//

import SwiftUI

struct NewTaskView: View {
    /// View Properties
    @Environment(\.dismiss) private var dismiss
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: Color = .red
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            }
            .hSpacing(.leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Task Title")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("Go for a Walk", text: $taskTitle)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: RoundedRectangle(cornerRadius: 10))
            }
            .padding(.top, 5)
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Date")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                   DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                .padding(.top, 5)
                /// Giving Some Space for tapping
                .padding(.trailing, -15)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    let colors: [Color] = [.red, .blue, .green, .cyan, .indigo]
                    
                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(color)
                                .frame(width: 20, height: 20)
                                .background(content: {
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .opacity(taskColor == color ? 1 : 0)
                                })
                                .hSpacing(.center)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.default) {
                                        taskColor = color
                                    }
                                }
                        }
                    }
                }
               
            }
            .padding(.top, 5)
            
            Spacer(minLength: 0)
            
            Button {
                
            } label: {
                Text("Create Task")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(taskColor, in: RoundedRectangle(cornerRadius: 10))
            }
            .disabled(taskTitle == "")
            .opacity(taskTitle == "" ? 0.5 : 1)
        }
        .padding(15)
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
            .vSpacing(.bottom)
    }
}
