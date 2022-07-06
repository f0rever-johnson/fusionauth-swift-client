//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/14/22.
//

import Foundation

public class UserIdentityProviderLinkEvent:BaseEvent{
    
    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    
    
    public var identityProviderLink:IdentityProviderLink?
    public var user:User?
    
    public init(id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, identityProviderLink: IdentityProviderLink? = nil, user: User? = nil) {
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
        self.identityProviderLink = identityProviderLink
        self.user = user
    }
}
