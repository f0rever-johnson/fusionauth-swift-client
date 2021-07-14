//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct PendingIdPLink:Codable{
 
    public var displayName:String? = nil
    public var email:String? = nil
    public var identityProviderId:UUID? = nil
    public var identityProviderName:String? = nil
    public var identityProviderType:IdentityProviderType? = nil
    public var identityProviderUserId:String? = nil
    public var user:User? = nil
    public var username:String? = nil
    
    public init(displayName: String? = nil, email: String? = nil, identityProviderId: UUID? = nil, identityProviderName: String? = nil, identityProviderType: IdentityProviderType? = nil, identityProviderUserId: String? = nil, user: User? = nil, username: String? = nil) {
        self.displayName = displayName
        self.email = email
        self.identityProviderId = identityProviderId
        self.identityProviderName = identityProviderName
        self.identityProviderType = identityProviderType
        self.identityProviderUserId = identityProviderUserId
        self.user = user
        self.username = username
    }
}
