//
//  UserRegistrationUpdateEvent.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class UserRegistrationUpdateEvent:BaseEvent, Codable{
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var applicationId:UUID? = nil
    public var original:UserRegistration? = nil
    public var registration:UserRegistration? = nil
    public var user:User? = nil

    public init(createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, original: UserRegistration? = nil, registration: UserRegistration? = nil, user: User? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.applicationId = applicationId
        self.original = original
        self.registration = registration
        self.user = user
    }

}
