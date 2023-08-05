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
    .init(taskTitle: "Record Video", creationDate: Calendar.current.date(
        byAdding: .hour,
        value: -1,
        to: Date()) ?? Date(), isComplete: true, tint: .yellow),
    .init(taskTitle: "Redesign Website", creationDate: Calendar.current.date(
        byAdding: .hour,
        value: 1,
        to: Date()) ?? Date(), isComplete: false, tint: .cyan),
    .init(taskTitle: "Go for a Walk", creationDate: Calendar.current.date(
        byAdding: .hour,
        value: -2,
        to: Date()) ?? Date(), isComplete: false, tint: .accentColor),
    .init(taskTitle: "Edit Video", creationDate: Calendar.current.date(
        byAdding: .hour,
        value: 2,
        to: Date()) ?? Date(), isComplete: true, tint: .indigo),
    .init(taskTitle: "Publish Video", creationDate: Calendar.current.date(
        byAdding: .hour,
        value: 0,
        to: Date()) ?? Date(), isComplete: false, tint: .mint),
    .init(taskTitle: "Tweet about new Video!", creationDate: Calendar.current.date(
        byAdding: .hour,
        value: 3,
        to: Date()) ?? Date(), isComplete: true, tint: .orange),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
