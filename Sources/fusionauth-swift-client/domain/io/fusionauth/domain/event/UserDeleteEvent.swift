//
//  UserDeleteEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserDeleteEvent:BaseEvent, Codable {
    public var id: UUID? = nil
    public var createInstant: Date? = nil
    public var tenantId: UUID? = nil
    public var user:User? = nil

    public init(id: UUID? = nil, createInstant: Date? = nil, tenantId: UUID? = nil, user: User? = nil) {
        self.id = id
        self.createInstant = createInstant
        self.tenantId = tenantId
        self.user = user
    }

}
