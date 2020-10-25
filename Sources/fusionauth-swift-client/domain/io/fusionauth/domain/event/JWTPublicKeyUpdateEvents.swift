//
//  JWTPublicKeyUpdateEvents.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct JWTPublicKeyUpdateEvent:BaseEvent, Codable{
    public var id: UUID? = nil
    public var createInstant: Date? = nil
    public var tenantId: UUID? = nil
    public var applicationIds:[UUID]? = nil

    public init(id: UUID? = nil, createInstant: Date? = nil, tenantId: UUID? = nil, applicationIds: [UUID]? = nil) {
        self.id = id
        self.createInstant = createInstant
        self.tenantId = tenantId
        self.applicationIds = applicationIds
    }


}
