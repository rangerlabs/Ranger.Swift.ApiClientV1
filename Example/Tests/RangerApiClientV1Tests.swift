// https://github.com/Quick/Quick

import Quick
import Nimble
import Ranger_Swift_ApiClientV1

class RangerApiClientV1Tests: QuickSpec {
    override func spec() {
        describe("RangerApiClientV1") {
            it("PostBreadcrumb throws when not a Breadcrumb API key") {
                expect {
                    try RangerApiClientV1.PostBreadcrumb(breadcrumb: Breadcrumb(deviceId: "a", position: LatLng(lat: 0 ,lng: 0), recordedAt: Date()), apiKey: "bad") { response in
                        return
                } }.to(throwError(InvalidApiKeyError.mustBeLiveOrTestApiKey))
            }
            it("PostBreadcrumb does NOT throw when a Breadcrumb API key") {
                expect {
                    try RangerApiClientV1.PostBreadcrumb(breadcrumb: Breadcrumb(deviceId: "a", position: LatLng(lat: 0 ,lng: 0), recordedAt: Date()), apiKey: "test.") { response in
                        return
                    }
                }.notTo(throwError())
                expect {
                    try RangerApiClientV1.PostBreadcrumb(breadcrumb: Breadcrumb(deviceId: "a", position: LatLng(lat: 0 ,lng: 0), recordedAt: Date()), apiKey: "live.") { response in
                        return
                    }
                }.notTo(throwError())
            }
            it("GetGeofenceByExternalId throws when not a Project API key") {
                expect {
                    try RangerApiClientV1.GetGeofenceByExternalId(apiKey: "bad", externalId: "") { response in
                        return
                    } }.to(throwError(InvalidApiKeyError.mustBeProjectApiKey))
            }
            it("GetGeofenceByExternalId does NOT throw when a Project API key") {
                expect {
                    try RangerApiClientV1.GetGeofenceByExternalId(apiKey: "proj.", externalId: "1") { response in
                        return
                    } }.notTo(throwError())
            }
            it("GetGeofenceByExternalId throws when externalId is empty") {
                expect {
                    try RangerApiClientV1.GetGeofenceByExternalId(apiKey: "proj.", externalId: "") { response in
                        return
                    } }.to(throwError(ApiInputError.externalIdRequired))
            }
            it("GetGeofenceByExternalId does NOT throw when externalId is not empty") {
                expect {
                    try RangerApiClientV1.GetGeofenceByExternalId(apiKey: "proj.", externalId: "1") { response in
                        return
                    } }.notTo(throwError())
            }
            it("GetPaginatedGeofences throws when not a Project API key") {
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "bad") { response in
                        return
                    } }.to(throwError(InvalidApiKeyError.mustBeProjectApiKey))
            }
            it("GetPaginatedGeofences does NOT throw when a Project API key") {
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.") { response in
                        return
                    } }.notTo(throwError())
            }
            it("GetPaginatedGeofences throws when pageCount < 1") {
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.", pageCount: 0) { response in
                        return
                    } }.to(throwError(ApiInputError.pageCountOutOfBounds("")))
            }
            it("GetPaginatedGeofences throws when pageCount > 1000") {
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.", pageCount: 1001) { response in
                        return
                    } }.to(throwError(ApiInputError.pageCountOutOfBounds("")))
            }
            it("GetPaginatedGeofences does NOT throw when pageCount between 1 and 1000") {
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.", pageCount: 1) { response in
                        return
                    } }.notTo(throwError())
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.", pageCount: 1000) { response in
                        return
                    } }.notTo(throwError())
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.", pageCount: 500) { response in
                        return
                    } }.notTo(throwError())
            }
            it("GetPaginatedGeofences throws when page < 0") {
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.", page: -1) { response in
                        return
                    } }.to(throwError(ApiInputError.pageOutOfBounds("")))
            }
            it("GetPaginatedGeofences does NOT throw when page >= 0") {
                expect {
                    try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.", page: 0) { response in
                        return
                    } }.notTo(throwError())
                expect {
                try RangerApiClientV1.GetPaginatedGeofences(apiKey: "proj.", page: 1) { response in
                    return
                } }.notTo(throwError())
            }
            it("CreateGeofence throws when not a Project API key") {
                expect {
                    try RangerApiClientV1.CreateGeofence(apiKey: "bad", geofence: Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)) { response in
                        return
                    } }.to(throwError(InvalidApiKeyError.mustBeProjectApiKey))
            }
            it("CreateGeofence does NOT throw when a Project API key") {
                expect {
                    try RangerApiClientV1.CreateGeofence(apiKey: "proj.", geofence: Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)) { response in
                        return
                    } }.notTo(throwError())
            }
            it("UpdateGeofence throws when not a Project API key") {
                expect {
                    try RangerApiClientV1.UpdateGeofence(apiKey: "bad", geofence: Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)) { response in
                        return
                    } }.to(throwError(InvalidApiKeyError.mustBeProjectApiKey))
            }
            it("UpdateGeofence does NOT throw when a Project API key") {
                expect {
                    try RangerApiClientV1.UpdateGeofence(apiKey: "proj.", geofence: Geofence(id: UUID(), externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)) { response in
                        return
                    } }.notTo(throwError())
            }
            it("UpdateGeofence throws when geofence.id is nil") {
                expect {
                    try RangerApiClientV1.UpdateGeofence(apiKey: "proj", geofence: Geofence(externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)) { response in
                        return
                    } }.to(throwError(ApiInputError.idRequired))
            }
            it("UpdateGeofence does NOT throw when geofence.id is not nil") {
                expect {
                    try RangerApiClientV1.UpdateGeofence(apiKey: "proj.", geofence: Geofence(id: UUID(), externalId: "1", shape: GeofenceShapes.Circle, coordinates: [LatLng(lat: 0, lng: 0)], radius: 100)) { response in
                        return
                    } }.notTo(throwError())
            }
            it("DeleteGeofence throws when not a Project API key") {
                expect {
                    try RangerApiClientV1.DeleteGeofence(apiKey: "bad", externalId: "") { response in
                        return
                    } }.to(throwError(InvalidApiKeyError.mustBeProjectApiKey))
            }
            it("DeleteGeofence does NOT throw when a Project API key") {
                expect {
                    try RangerApiClientV1.DeleteGeofence(apiKey: "proj.", externalId: "1") { response in
                            return
                    } }.notTo(throwError())
            }
            it("DeleteGeofence throws when externalId is empty") {
                expect {
                    try RangerApiClientV1.DeleteGeofence(apiKey: "proj.", externalId: "") { response in
                        return
                    } }.to(throwError(ApiInputError.externalIdRequired))
            }
            it("DeleteGeofence does NOT throw when externalId is not empty") {
                expect {
                    try RangerApiClientV1.DeleteGeofence(apiKey: "proj.", externalId: "1") { response in
                            return
                    } }.notTo(throwError())
            }
            it("BulkDeleteGeofence throws when not a Project API key") {
                expect {
                    try RangerApiClientV1.BulkDeleteGeofences(apiKey: "bad", externalIds: []) { response in
                        return
                    } }.to(throwError(InvalidApiKeyError.mustBeProjectApiKey))
            }
            it("BulkDeleteGeofence does NOT throw when a Project API key") {
                expect {
                    try RangerApiClientV1.BulkDeleteGeofences(apiKey: "proj.", externalIds: [UUID().uuidString]) { response in
                            return
                    } }.notTo(throwError())
            }
            it("BulkDeleteGeofence throws when externalIds is empty") {
                expect {
                    try RangerApiClientV1.BulkDeleteGeofences(apiKey: "proj.", externalIds: []) { response in
                        return
                    } }.to(throwError(ApiInputError.externalIdCollectionRequired))
            }
            it("BulkDeleteGeofence does NOT throw when externalIds is not empty") {
                expect {
                    try RangerApiClientV1.BulkDeleteGeofences(apiKey: "proj.", externalIds: [UUID().uuidString]) { response in
                            return
                    } }.notTo(throwError())
            }
            it("GetIntegrations throws when not a Project API key") {
                expect {
                    try RangerApiClientV1.GetIntegrations(apiKey: "bad") { response in
                        return
                    } }.to(throwError(InvalidApiKeyError.mustBeProjectApiKey))
            }
            it("GetIntegrations does NOT throw when a Project API key") {
                expect {
                    try RangerApiClientV1.GetIntegrations(apiKey: "proj.") { response in
                            return
                    } }.notTo(throwError())
            }
        }
        
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
            it("throws when lat < -180") {
                expect{try LatLng(lat: 0, lng: 181)}.to(throwError(LatLngErrors.lngOutOfRange("")))
            }
        }
    }
}
