//
//  UserBulkCreateEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct UserBulkCreateEvent:BaseEvent, Codable {
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var users:[User]? = nil

    public init(createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil, users: [User]? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.users = users
    }

}
