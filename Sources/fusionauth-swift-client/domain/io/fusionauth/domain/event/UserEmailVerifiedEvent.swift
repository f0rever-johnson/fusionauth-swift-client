//
//  UserEmailVerifiedEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class UserEmailVerifiedEvent:BaseEvent,Codable{
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var user:User? = nil

    public init(createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil, user: User? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.user = user
    }

}

