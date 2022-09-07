//
//  JWTPublicKeyUpdateEvents.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
   * Models the JWT public key Refresh Token Revoke Event. This event might be for a single
   * token, a user or an entire application.
   */

public class JWTPublicKeyUpdateEvent:BaseEvent, Codable{

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var createInstant: Date?
    public var tenantId: UUID?
    public var applicationIds:[UUID]?

    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, createInstant: Date? = nil, tenantId: UUID? = nil, applicationIds: [UUID]? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.createInstant = createInstant
        self.tenantId = tenantId
        self.applicationIds = applicationIds
    }


}
