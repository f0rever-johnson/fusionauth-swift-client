//
//  UserRegistrationVerifiedEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

//Models the User Registration Verified Event.

public class UserRegistrationVerifiedEvent:BaseEvent,Codable{
  
    public var applicationIds:[UUID]?
    public var createInstant:Date?
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var applicationId:UUID?
    public var registration:UserRegistration?
    public var user:User?

    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, registration: UserRegistration? = nil, user: User? = nil) {
        self.applicationIds = applicationIds
        self.createInstant = createInstant
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.applicationId = applicationId
        self.registration = registration
        self.user = user
    }
}
