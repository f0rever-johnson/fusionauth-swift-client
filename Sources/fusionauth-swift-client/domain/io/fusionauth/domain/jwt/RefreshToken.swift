//
//  RefreshToken.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Refresh Token Object.
 */

public struct RefreshToken:Codable {
    public var applicationId:UUID? = nil
    public var insertInstant:Date? = nil
    public var metaData:MetaData? = nil
    public var startInstant:Date? = nil
    public var token:String? = nil
    public var userId:UUID? = nil

    public init(applicationId: UUID? = nil, insertInstant: Date? = nil, metaData: MetaData? = nil, startInstant: Date? = nil, token: String? = nil, userId: UUID? = nil) {
        self.applicationId = applicationId
        self.insertInstant = insertInstant
        self.metaData = metaData
        self.startInstant = startInstant
        self.token = token
        self.userId = userId
    }

}
