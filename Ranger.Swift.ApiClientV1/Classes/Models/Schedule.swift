//
//  Schedule.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

import Foundation

struct DailySchedule: Codable {
    internal init(startTime: String, endTime: String) {
        self.startTime = startTime
        self.endTime = endTime
    }
    
    var startTime: String
    var endTime: String
}

struct Schedule: Codable {
    internal init(timeZoneId: String, sunday: DailySchedule, monday: DailySchedule, tuesday: DailySchedule, wednesday: DailySchedule, thursday: DailySchedule, friday: DailySchedule, saturday: DailySchedule) {
        self.timeZoneId = timeZoneId
        self.sunday = sunday
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
    }
    
    let timeZoneId: String
    let sunday: DailySchedule
    let monday: DailySchedule
    let tuesday: DailySchedule
    let wednesday: DailySchedule
    let thursday: DailySchedule
    let friday: DailySchedule
    let saturday: DailySchedule
}
