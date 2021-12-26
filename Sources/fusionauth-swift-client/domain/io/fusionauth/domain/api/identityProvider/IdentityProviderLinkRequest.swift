//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct IdentityProviderLinkRequest:Codable{

    public var displayName:String?
    public var identityProviderId:UUID?
    public var identityProviderUserId:UUID?
    public var pendingIdPLinkId:String?
    public var userId:UUID?
    
    public init(displayName: String? = nil, identityProviderId: UUID? = nil, identityProviderUserId: UUID? = nil, pendingIdPLinkId: String? = nil, userId: UUID? = nil) {
        self.displayName = displayName
        self.identityProviderId = identityProviderId
        self.identityProviderUserId = identityProviderUserId
        self.pendingIdPLinkId = pendingIdPLinkId
        self.userId = userId
    }
    
   
}
