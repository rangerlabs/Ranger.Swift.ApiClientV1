//
//  RangerApiResponse.swift
//
//  Created by Nicholas Cromwell  on 12/12/20.
//

struct RangerApiResponse<T:Codable>: Codable {
    var statusCode: Int
    var message: String?
    @DecodableDefault.False var isError: Bool
    var error: RangerApiError?
    var result: T?
}

struct RangerApiError: Codable {
    var message: String?
    var validationErrors: [ValidationError]?
}

struct ValidationError: Codable {
    var name: String?
    var reason: String?
}
