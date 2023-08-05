//
//  TaskRowView.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 29/7/23.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(indicatorColor)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: Circle())
                .overlay {
                    Circle()
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)
                        .onTapGesture {
                            withAnimation(.default) {
                                task.isComplete.toggle()
                            }
                        }
                }
            VStack(alignment: .leading, spacing: 8) {
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .strikethrough(task.isComplete, pattern: .solid, color: .black)
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding(15)
            .hSpacing(.leading)
            .background(task.tint, in: RoundedRectangle(cornerRadius: 15))
            .strikethrough(task.isComplete, pattern: .solid, color: .black)
            .offset(y: -8)
        }
        .hSpacing(.leading)
    }
    
    var indicatorColor: Color {
        if task.isComplete{
            return .green
        }
        
        return task.creationDate.isSameHour ? .blue : (task.creationDate.isPast ? .red : .black)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        Hometown()
    }
}
