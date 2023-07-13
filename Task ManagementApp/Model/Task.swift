//
//  Task.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 13/7/23.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isComplete: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Record Video", creationDate: Date(), isComplete: true, tint: .red),
    .init(taskTitle: "Redesign Website", creationDate: Date(), isComplete: true, tint: .red),
    .init(taskTitle: "Go for a Walk", creationDate: Date(), isComplete: true, tint: .red),
    .init(taskTitle: "Edit Video", creationDate: Date(), isComplete: true, tint: .red),
    .init(taskTitle: "Publish Video", creationDate: Date(), isComplete: true, tint: .red),
    .init(taskTitle: "Tweet about new Video!", creationDate: Date(), isComplete: true, tint: .red),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
