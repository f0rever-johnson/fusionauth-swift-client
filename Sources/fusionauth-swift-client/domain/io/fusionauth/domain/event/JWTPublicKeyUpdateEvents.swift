//
//  JWTPublicKeyUpdateEvents.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct JWTPublicKeyUpdateEvent:BaseEvent, Codable{

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID? = nil
    public var createInstant: Date? = nil
    public var tenantId: UUID? = nil
    public var applicationIds:[UUID]? = nil

    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, createInstant: Date? = nil, tenantId: UUID? = nil, applicationIds: [UUID]? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.createInstant = createInstant
        self.tenantId = tenantId
        self.applicationIds = applicationIds
    }


}
