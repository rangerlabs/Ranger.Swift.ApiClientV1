//
//  Geofence.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

import Foundation

public struct Geofence: Codable {
    public init(id: UUID? = nil, externalId: String, shape: GeofenceShapes, coordinates: [LatLng], radius: Int? = nil, projectId: UUID? = nil, description: String? = nil, integrationIds: [UUID] = [], metadata: [KeyValuePair] = [], onEnter: Bool = true, onDwell: Bool = false, onExit: Bool = true, enabled: Bool = true, schedule: Schedule? = nil, createdDate: Date? = nil, updatedDate: Date? = nil) throws {
        if (externalId.isEmpty) {
            throw GeofenceErrors.externalIdRequired
        }
        if (shape == GeofenceShapes.Circle) {
            if (radius == nil || radius! < 100) {
                throw GeofenceErrors.radiusMustBeGreaterThanOrEqualTo100
            }
            if (coordinates.count != 1) {
                throw GeofenceErrors.coordinatesMustContainExactly1LatLng
            }
        } else {
            if (!(coordinates.count >= 3)) {
                throw GeofenceErrors.coordinatesMustContainAtLeast3LatLng
            }
        }
        self.id = id
        self.externalId = externalId
        self.shape = shape
        self.coordinates = coordinates
        self.radius = radius
        self.projectId = projectId
        self.description = description
        self.integrationIds = integrationIds
        self.metadata = metadata
        self.onEnter = onEnter
        self.onDwell = onDwell
        self.onExit = onExit
        self.enabled = enabled
        self.schedule = schedule
        self.createdDate = createdDate
        self.updatedDate = updatedDate
    }
    
    var id: UUID?
    var externalId: String
    var shape: GeofenceShapes
    var coordinates: [LatLng]
    var radius: Int?
    var projectId: UUID?
    var description: String?
    var integrationIds: [UUID]
    var metadata: [KeyValuePair]
    var onEnter: Bool
    var onDwell: Bool
    var onExit: Bool
    var enabled: Bool
    var schedule: Schedule?
    var createdDate: Date?
    var updatedDate: Date?
}

public enum GeofenceErrors: Error {
    case externalIdRequired
    case radiusMustBeGreaterThanOrEqualTo100
    case coordinatesMustContainExactly1LatLng
    case coordinatesMustContainAtLeast3LatLng
}
