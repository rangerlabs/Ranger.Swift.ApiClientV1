//
//  Integration.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

import Foundation

public struct Integration: Codable {
    public init(id: UUID, type: IntegrationTypes, name: String, description: String, projectId: UUID) {
        self.id = id
        self.type = type
        self.name = name
        self.description = description
        self.projectId = projectId
    }
    
    var id: UUID
    var type: IntegrationTypes
    var name: String
    var description: String
    var projectId: UUID
}
