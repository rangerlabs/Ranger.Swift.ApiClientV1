//
//  Schedule.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

import Foundation

public class DailySchedule: Codable {
    public init(startTime: String, endTime: String) throws {
        if (startTime.isEmpty) {
            throw DailyScheduleErrors.startTimeRequired
        }
        if (endTime.isEmpty) {
            throw DailyScheduleErrors.endTimeRequired
        }

        self.startTime = startTime
        self.endTime = endTime
    }
    
    var startTime: String
    var endTime: String
}

public struct Schedule: Codable {
    public init(timeZoneId: String, sunday: DailySchedule, monday: DailySchedule, tuesday: DailySchedule, wednesday: DailySchedule, thursday: DailySchedule, friday: DailySchedule, saturday: DailySchedule) {
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

public enum DailyScheduleErrors: Error {
    case incorrectFormat(String)
    case startTimeMustBeLessThanEndTime
    case startTimeRequired
    case endTimeRequired
}
