//
//  UserUpdateEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserUpdateEvent:BaseEvent, Codable {

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var user:User? = nil
    public var orignal:User? = nil

    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, user: User? = nil, orignal: User? = nil) {
        self.info = info
        self.type = type
       
        self.id = id
        self.tenantId = tenantId
        self.user = user
        self.orignal = orignal
    }

}
