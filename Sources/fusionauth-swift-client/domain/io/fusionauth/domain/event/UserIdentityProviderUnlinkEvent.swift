//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/14/22.
//

import Foundation

public class UserIdentityProviderUnlinkEvent:BaseEvent{

    public var applicationIds:[UUID]?
    public var createInstant:Date?
    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    
    public var identityProviderLink:IdentityProviderLink?
    public var user:User?
    
    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, identityProviderLink: IdentityProviderLink? = nil, user: User? = nil) {
        self.applicationIds = applicationIds
        self.createInstant = createInstant
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
        self.identityProviderLink = identityProviderLink
        self.user = user
    }
    
    
}
