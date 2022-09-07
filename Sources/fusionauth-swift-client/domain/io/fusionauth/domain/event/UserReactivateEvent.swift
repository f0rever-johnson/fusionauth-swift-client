//
//  UserReactivateEvent.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

//Models the User Reactivate Event.

public class UserReactivateEvent:BaseEvent, Codable {

    public var applicationIds:[UUID]?
    public var createInstant:Date?
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var user:User?

    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, user: User? = nil) {
        self.applicationIds = applicationIds
        self.createInstant = createInstant
        self.info = info
        self.type = type
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.user = user
    }


}
