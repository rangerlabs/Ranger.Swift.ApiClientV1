//
//  Integration.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

import Foundation

struct Integration: Codable {
    var id: UUID
    var type: IntegrationTypes
    var name: String
    var description: String
    var projectId: UUID
}
