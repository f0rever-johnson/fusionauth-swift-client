//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class UserPasswordResetSuccessEvent:BaseEvent{
 
    public var applicationIds:[UUID]?
    public var createInstant:Date?
    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var user:User?

    
    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, user: User? = nil) {
         self.applicationIds = applicationIds
         self.createInstant = createInstant
         self.id = id
         self.info = info
         self.tenantId = tenantId
         self.type = type
         self.user = user
     }
}
