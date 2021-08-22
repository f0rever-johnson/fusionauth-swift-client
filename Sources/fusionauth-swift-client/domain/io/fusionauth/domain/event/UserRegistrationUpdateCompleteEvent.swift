//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class UserRegistrationUpdateCompleteEvent:BaseEvent{

    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var applicationId:UUID?
    public var original:UserRegistration?
    public var registration:UserRegistration?
    public var user:User?

    internal init(id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, applicationId: UUID? = nil, original: UserRegistration? = nil, registration: UserRegistration? = nil, user: User? = nil) {
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
