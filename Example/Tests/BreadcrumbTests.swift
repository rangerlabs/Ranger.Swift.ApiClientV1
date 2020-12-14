//
//  BreadcrumbTests.swift
//  RangerApiClientV1_Tests
//
//  Created by Nicholas Cromwell  on 12/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Ranger_Swift_ApiClientV1

class BreacrumbTests: QuickSpec {
    override func spec() {
        describe("Breadcrumb init") {
            it("throws when deviceId is empty") {
                expect{try Breadcrumb(deviceId: "", position: LatLng(lat: 0,lng: 0), recordedAt: Date())}.to(throwError(BreadcrumbErrors.deviceIdRequired))
            }
            it("does NOT throw when deviceId is not empty") {
                expect{try Breadcrumb(deviceId: "1", position: LatLng(lat: 0,lng: 0), recordedAt: Date())}.notTo(throwError())
            }
        }
    }
}
