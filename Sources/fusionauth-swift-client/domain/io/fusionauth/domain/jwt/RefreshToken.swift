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

    public var applicationId:UUID?
    public var data:JSONObject?
    public var id:UUID?
    public var insertInstant:Date?
    public var metaData:MetaData?
    public var startInstant:Date?
    public var tenantId:UUID?
    public var token:String?
    public var userId:UUID?
    
    public init(applicationId: UUID? = nil, data: JSONObject? = nil, id: UUID? = nil, insertInstant: Date? = nil, metaData: MetaData? = nil, startInstant: Date? = nil, tenantId: UUID? = nil, token: String? = nil, userId: UUID? = nil) {
        self.applicationId = applicationId
        self.data = data
        self.id = id
        self.insertInstant = insertInstant
        self.metaData = metaData
        self.startInstant = startInstant
        self.tenantId = tenantId
        self.token = token
        self.userId = userId
    }
}
