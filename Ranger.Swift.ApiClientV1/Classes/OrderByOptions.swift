//
//  OrderByOptions.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

enum OrderByOptions: String, Codable {
    case externalId = "ExternalId"
    case createdDate = "CreatedDate"
    case updatedDate = "UpdatedDate"
    case enabled = "Enabled"
    case shape = "Shape"
}
