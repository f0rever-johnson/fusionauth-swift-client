//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class UserPasswordEvent:BaseEvent{

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID? = nil
    public var tenantId: UUID?
    public var user:User? = nil
    
    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, user: User? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.user = user
    }
}
