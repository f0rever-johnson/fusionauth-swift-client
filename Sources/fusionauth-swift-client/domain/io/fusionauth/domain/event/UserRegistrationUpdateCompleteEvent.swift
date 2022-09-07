//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

//Models the User Update Registration Event.

public class UserRegistrationUpdateCompleteEvent:BaseEvent{
    
    public var applicationIds:[UUID]?
    public var createInstant:Date?
    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var applicationId:UUID?
    public var original:UserRegistration?
    public var registration:UserRegistration?
    public var user:User?

    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, applicationId: UUID? = nil, original: UserRegistration? = nil, registration: UserRegistration? = nil, user: User? = nil) {
        self.applicationIds = applicationIds
        self.createInstant = createInstant
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
        self.applicationId = applicationId
        self.original = original
        self.registration = registration
        self.user = user
    }

}
