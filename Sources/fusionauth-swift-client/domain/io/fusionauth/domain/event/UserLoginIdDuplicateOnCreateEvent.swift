//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class UserLoginIdDuplicateOnCreateEvent:BaseEvent{

    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var duplicateEmail:String?
    public var duplicateUsername:String?
    public var existing:User?
    public var user:User?

    public init(id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, duplicateEmail: String? = nil, duplicateUsername: String? = nil, existing: User? = nil, user: User? = nil) {
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
        self.duplicateEmail = duplicateEmail
        self.duplicateUsername = duplicateUsername
        self.existing = existing
        self.user = user
    }
}
