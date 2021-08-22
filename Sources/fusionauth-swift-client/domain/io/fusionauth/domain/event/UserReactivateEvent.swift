//
//  UserReactivateEvent.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserReactivateEvent:BaseEvent, Codable {
 
    public var info: EventInfo?
    public var type: EventType?
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var user:User? = nil
    
    public init(info: EventInfo? = nil, type: EventType? = nil, createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil, user: User? = nil) {
        self.info = info
        self.type = type
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.user = user
    }
   

}
