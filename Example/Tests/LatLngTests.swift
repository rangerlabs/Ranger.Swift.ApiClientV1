//
//  LatLngTests.swift
//  Ranger.Swift.ApiClientV1_Tests
//
//  Created by Nicholas Cromwell  on 12/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Ranger_Swift_ApiClientV1

class LatLngTests: QuickSpec {
    override func spec() {
        describe("LatLng init") {
            it("throws when lat < -90") {
                expect{try LatLng(lat: -91,lng: 0)}.to(throwError(LatLngErrors.latOutOfRange("")))
            }
            it("throws when lat > 90") {
                expect{try LatLng(lat: 91,lng: 0)}.to(throwError(LatLngErrors.latOutOfRange("")))
            }
            it("throws when lng < -180") {
                expect{try LatLng(lat: 0,lng: -181)}.to(throwError(LatLngErrors.lngOutOfRange("")))
            }
            it("throws when lng < -180") {
                expect{try LatLng(lat: 0, lng: 181)}.to(throwError(LatLngErrors.lngOutOfRange("")))
            }
            it("does NOT throw when lat between [-90, 90]") {
                expect{try LatLng(lat: -90,lng: 0)}.notTo(throwError())
                expect{try LatLng(lat: 0,lng: 0)}.notTo(throwError())
                expect{try LatLng(lat: 90,lng: 0)}.notTo(throwError())
            }
            it("does NOT throw when lng between [-180, 180]") {
                expect{try LatLng(lat: 0,lng: -180)}.notTo(throwError())
                expect{try LatLng(lat: 0,lng: 0)}.notTo(throwError())
                expect{try LatLng(lat: 0,lng: 180)}.notTo(throwError())
            }
        }
    }
}
