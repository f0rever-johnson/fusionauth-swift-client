//
//  UserLoginSuccessEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class UserLoginSuccessEvent:BaseEvent, Codable{

    public var applicationIds:[UUID]?
    public var createInstant:Date?

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID?
    public var tenantId: UUID?
    public var applicationId:UUID?
    public var authenticationType:String?
    public var identityProviderId:UUID?
    public var identityProviderName:String?
    public var ipAddress:String?
    public var user:User?
    
    public init(applicationIds: [UUID]? = nil, createInstant: Date? = nil, info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, authenticationType: String? = nil, identityProviderId: UUID? = nil, identityProviderName: String? = nil, ipAddress: String? = nil, user: User? = nil) {
        self.applicationIds = applicationIds
        self.createInstant = createInstant
        self.info = info
        self.type = type
        self.id = id
        self.tenantId = tenantId
        self.applicationId = applicationId
        self.authenticationType = authenticationType
        self.identityProviderId = identityProviderId
        self.identityProviderName = identityProviderName
        self.ipAddress = ipAddress
        self.user = user
    }

}
