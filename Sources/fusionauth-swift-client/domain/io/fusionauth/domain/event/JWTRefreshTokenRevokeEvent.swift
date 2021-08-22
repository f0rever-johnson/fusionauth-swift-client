//
//  JWTRefreshTokenRevokeEvent.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct JWTRefreshTokenRevokeEvent:BaseEvent, Codable {

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var userId:UUID?
    public var user:User?
    public var applicationTimeToLiveInSeconds:[UUID:Int]?
    public var applicationId:UUID? 

    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, userId: UUID? = nil, user: User? = nil, applicationTimeToLiveInSeconds: [UUID : Int]? = nil, applicationId: UUID? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.userId = userId
        self.user = user
        self.applicationTimeToLiveInSeconds = applicationTimeToLiveInSeconds
        self.applicationId = applicationId
    }

}
