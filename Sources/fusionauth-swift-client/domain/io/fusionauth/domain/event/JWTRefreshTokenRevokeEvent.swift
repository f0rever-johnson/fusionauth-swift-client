//
//  JWTRefreshTokenRevokeEvent.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
   * Models the Refresh Token Revoke Event. This event might be for a single token, a use or an entire application.
   */

public class JWTRefreshTokenRevokeEvent:BaseEvent, Codable {
    
    public var applicationIds:[UUID]?
    public var createInstant:Date?
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var userId:UUID?
    public var user:User?
    public var applicationTimeToLiveInSeconds:[UUID:Int]?
    public var refreshToken:RefreshToken?
    public var applicationId:UUID?

    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, userId: UUID? = nil, user: User? = nil, applicationTimeToLiveInSeconds: [UUID : Int]? = nil, refreshToken: RefreshToken? = nil, applicationId: UUID? = nil) {
        self.applicationIds = applicationIds
        self.createInstant = createInstant
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.userId = userId
        self.user = user
        self.applicationTimeToLiveInSeconds = applicationTimeToLiveInSeconds
        self.refreshToken = refreshToken
        self.applicationId = applicationId
    }
}
