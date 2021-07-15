//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct IdentityProviderLinkRequest:Codable{

    public var displayName:String? = nil
    public var identityProviderId:UUID? = nil
    public var identityProviderUserId:UUID? = nil
    public var pendingIdPLinkId:String? = nil
    public var userId:UUID? = nil
    
    public init(displayName: String? = nil, identityProviderId: UUID? = nil, identityProviderUserId: UUID? = nil, pendingIdPLinkId: String? = nil, userId: UUID? = nil) {
        self.displayName = displayName
        self.identityProviderId = identityProviderId
        self.identityProviderUserId = identityProviderUserId
        self.pendingIdPLinkId = pendingIdPLinkId
        self.userId = userId
    }
    
   
}
