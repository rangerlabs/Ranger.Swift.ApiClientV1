//
//  GeofenceTests.swift
//  Ranger.Swift.ApiClientV1_Tests
//
//  Created by Nicholas Cromwell  on 12/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Ranger_Swift_ApiClientV1

class GeofenceTests: QuickSpec {
    override func spec() {
        describe("Geofence init") {
            it("throws when externalId empty") {
                expect{try Geofence(externalId: "", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)}.to(throwError(GeofenceErrors.externalIdRequired))
            }
            it("does NOT throw when externalId is not empty") {
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)}.notTo(throwError())
            }
            it("throws when shape is circle and radius is less than 100") {
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)])}.to(throwError(GeofenceErrors.radiusMustBeGreaterThanOrEqualTo100))
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 99)}.to(throwError(GeofenceErrors.radiusMustBeGreaterThanOrEqualTo100))
            }
            it("does NOT throw when shape is circle and radius is greater than or equal to 100") {
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)}.notTo(throwError())
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 101)}.notTo(throwError())
            }
            it("throws when shape is circle and coordinates.count is not 1") {
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [], radius: 100)}.to(throwError(GeofenceErrors.coordinatesMustContainExactly1LatLng))
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0), LatLng(lat: 0, lng: 0)], radius: 100)}.to(throwError(GeofenceErrors.coordinatesMustContainExactly1LatLng))
            }
            it("does NOT throw when shape is circle and coordinates.count is 1"){
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)}.notTo(throwError())
            }
            it("throws when shape is polygon and coordinates.count is not greater than or equal to 3") {
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Polygon, coordinates: [LatLng(lat: 0, lng: 0), LatLng(lat: 0, lng: 0)])}.to(throwError(GeofenceErrors.coordinatesMustContainAtLeast3LatLng))
            }
            it("does NOT throw when shape is polygon and coordinates.count is greater than or equal to 3") {
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Polygon, coordinates: [LatLng(lat: 0, lng: 0), LatLng(lat: 0, lng: 0), LatLng(lat: 0, lng: 0)])}.notTo(throwError())
                expect{try Geofence(externalId: "1", shape: GeofenceShapes.Polygon, coordinates: [LatLng(lat: 0, lng: 0), LatLng(lat: 0, lng: 0), LatLng(lat: 0, lng: 0), LatLng(lat: 0, lng: 0)])}.notTo(throwError())
            }
        }
    }
}
