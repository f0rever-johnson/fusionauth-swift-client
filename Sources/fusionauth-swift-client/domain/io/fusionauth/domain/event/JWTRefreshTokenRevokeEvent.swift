//
//  JWTRefreshTokenRevokeEvent.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct JWTRefreshTokenRevokeEvent:BaseEvent, Codable {
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var userId:UUID? = nil
    public var user:User? = nil
    public var applicationTimeToLiveInSeconds:[UUID:Int]? = nil
    public var applicationId:UUID? = nil

    public init(createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil, userId: UUID? = nil, user: User? = nil, applicationTimeToLiveInSeconds: [UUID:Int]? = nil, applicationId: UUID? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.userId = userId
        self.user = user
        self.applicationTimeToLiveInSeconds = applicationTimeToLiveInSeconds
        self.applicationId = applicationId
    }

}
