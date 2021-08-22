//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class UserRegistrationDeleteCompleteEvent:BaseEvent{
    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var applicationId:UUID? = nil
    public var registration:UserRegistration? = nil
    public var user:User? = nil

    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, registration: UserRegistration? = nil, user: User? = nil) {
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.applicationId = applicationId
        self.registration = registration
        self.user = user
    }
}