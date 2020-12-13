//
//  Geofence.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

import Foundation

struct Geofence: Codable {
    var id: UUID? = nil
    var externalId: String
    var shape: GeofenceShapes
    var coordinates: [LatLng]
    var radius: Int? = nil
    var projectId: UUID? = nil
    var description: String? = nil
    var integrationIds: [UUID] = []
    var metadata: [KeyValuePair] = []
    var onEnter: Bool = true
    var onDwell: Bool = false
    var onExit: Bool = true
    var enabled: Bool = true
    var schedule: Schedule? = nil
    var createdDate: Date? = nil
    var updatedDate: Date? = nil
}
