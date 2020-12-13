//
//  ApiValidationErrors.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

enum InvalidApiKeyError: Error {
    case mustBeLiveOrTestApiKey
    case mustBeProjectApiKey
}

enum ApiInputError: Error {
    case externalIdRequired
    case externalIdCollectionRequired
    case pageCountOutOfBounds(String)
    case pageOutOfBounds(String)
    case idRequired
}
