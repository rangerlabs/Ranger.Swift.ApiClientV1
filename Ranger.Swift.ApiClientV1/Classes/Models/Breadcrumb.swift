//
//  Breadcrumb.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

import Foundation

public struct Breadcrumb: Codable {
    public init(deviceId: String, position: LatLng, recordedAt: Date, acceptedAt: Date? = nil, externalUserId: String? = "", accuracy: Int? = 0, metadata: [KeyValuePair]? = []) throws {
        if (deviceId.isEmpty) {
            throw BreadcrumbErrors.deviceIdRequired
        }
        self.deviceId = deviceId
        self.position = position
        self.recordedAt = recordedAt
        self.acceptedAt = acceptedAt
        self.externalUserId = externalUserId
        self.accuracy = accuracy
        self.metadata = metadata
    }
    
    let deviceId: String
    let position: LatLng
    let recordedAt: Date
    var acceptedAt: Date?
    var externalUserId: String?
    var accuracy: Int?
    var metadata: [KeyValuePair]?
}

public enum BreadcrumbErrors: Error {
    case deviceIdRequired
}
