//
//  ScheduleTests.swift
//  Ranger.Swift.ApiClientV1_Tests
//
//  Created by Nicholas Cromwell  on 12/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Ranger_Swift_ApiClientV1

class ScheduleTests: QuickSpec {
    override func spec() {
        describe("DailySchedule init") {
            it("throws when startTime empty") {
                expect{try DailySchedule(startTime: "", endTime: "12:00:00")}.to(throwError(DailyScheduleErrors.startTimeRequired))
            }
            it("does NOT throw when startTime is not empty") {
                expect{try DailySchedule(startTime: "11:59:59", endTime: "12:00:00")}.notTo(throwError())
            }
            it("throws when endTime empty") {
                expect{try DailySchedule(startTime: "11:59:59", endTime: "")}.to(throwError(DailyScheduleErrors.endTimeRequired))
            }
            it("does NOT throw when endTime is not empty") {
                expect{try DailySchedule(startTime: "11:59:59", endTime: "12:00:00")}.notTo(throwError())
            }
        }
    }
}
