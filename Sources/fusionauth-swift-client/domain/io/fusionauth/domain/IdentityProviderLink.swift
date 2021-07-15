//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public class IdentityProviderLink:Codable{
    
    public var data:JSONObject? = nil
    public var displayName:String? = nil
    public var identityProviderId:UUID? = nil
    public var identityProviderUserId:String? = nil
    public var insertInstant:Date? = nil
    public var lastLoginInstant:Date? = nil
    public var tenantId:UUID? = nil
    public var token:String? = nil
    public var userId:UUID? = nil
    
    public init(data: JSONObject? = nil, displayName: String? = nil, identityProviderId: UUID? = nil, identityProviderUserId: String? = nil, insertInstant: Date? = nil, lastLoginInstant: Date? = nil, tenantId: UUID? = nil, token: String? = nil, userId: UUID? = nil) {
        self.data = data
        self.displayName = displayName
        self.identityProviderId = identityProviderId
        self.identityProviderUserId = identityProviderUserId
        self.insertInstant = insertInstant
        self.lastLoginInstant = lastLoginInstant
        self.tenantId = tenantId
        self.token = token
        self.userId = userId
    }
}
