//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public class IdentityProviderLink:Codable{
    
    public var data:JSONObject?
    public var displayName:String?
    public var identityProviderId:UUID?
    public var identityProviderUserId:String?
    public var insertInstant:Date?
    public var lastLoginInstant:Date?
    public var tenantId:UUID?
    public var token:String?
    public var userId:UUID?
    
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
