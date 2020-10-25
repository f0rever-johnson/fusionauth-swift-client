//
//  UserLoginSuccessEvent.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class UserLoginSuccessEvent:BaseEvent, Codable{
    public var createInstant: Date? = nil
    public var id: UUID? = nil
    public var tenantId: UUID? = nil
    public var applicationId:UUID? = nil
    public var authenticationType:String? = nil
    public var identityProviderId:UUID? = nil
    public var identityProviderName:String? = nil
    public var user:User? = nil

    public init(createInstant: Date? = nil, id: UUID? = nil, tenantId: UUID? = nil, applicationId: UUID? = nil, authenticationType: String? = nil, identityProviderId: UUID? = nil, identityProviderName: String? = nil, user: User? = nil) {
        self.createInstant = createInstant
        self.id = id
        self.tenantId = tenantId
        self.applicationId = applicationId
        self.authenticationType = authenticationType
        self.identityProviderId = identityProviderId
        self.identityProviderName = identityProviderName
        self.user = user
    }

}
