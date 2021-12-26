//
//  UserDeleteEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserDeleteEvent:BaseEvent, Codable {
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var user:User?


    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, user: User? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.user = user
    }
}
