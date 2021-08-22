//
//  UserLoginSuccessEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class UserLoginSuccessEvent:BaseEvent, Codable{

    public var info: EventInfo?
    public var type: EventType?
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var applicationId:UUID? = nil
    public var authenticationType:String? = nil
    public var identityProviderId:UUID? = nil
    public var identityProviderName:String? = nil
    public var ipAddress:String? = nil
    public var user:User? = nil
    
    public init(info: EventInfo? = nil, type: EventType? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, authenticationType: String? = nil, identityProviderId: UUID? = nil, identityProviderName: String? = nil, ipAddress: String? = nil, user: User? = nil) {
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
