//
//  Date+Extensions.swift
//  Task ManagementApp
//
//  Created by loun sokphea on 13/7/23.
//

import SwiftUI

/// Date Extensions Needed for Building UI
extension Date {
    /// Custom Date Format
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    /// Fetching Week Based on given
    func fetchWeek(_ date: Date = .init())-> [WeekDay] {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startDate)
        guard let startOfWeek = weekForDate?.start else {
            return []
        }
        
        /// Iteration to get the Full Week
        (0..<7).forEach { index in
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfWeek){
                week.append(.init(date: weekDay))
            }
        }
        
        return week
    }
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
}
