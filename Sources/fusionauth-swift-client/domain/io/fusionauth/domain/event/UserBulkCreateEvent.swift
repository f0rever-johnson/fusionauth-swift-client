//
//  UserBulkCreateEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserBulkCreateEvent:BaseEvent, Codable {
    
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var users:[User]?

    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, users: [User]? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.users = users
    }

}
