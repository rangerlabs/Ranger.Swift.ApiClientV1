//
//  Breadcrumb.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

import Foundation

struct Breadcrumb: Codable {
    var deviceId: String
    var position: LatLng
    var recordedAt: Date
    var acceptedAt: Date? = nil
    var externalUserId: String? = ""
    var accuracy: Int? = 0
    var metadata: [KeyValuePair]? = []
}
