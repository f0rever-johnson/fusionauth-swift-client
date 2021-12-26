//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct PendingIdPLink:Codable{

    public var displayName:String?
    public var email:String?
    public var identityProviderId:UUID?
    public var identityProviderLinks:[IdentityProviderLink]?
    public var identityProviderName:String?
    public var identityProviderTenantConfiguration:[IdentityProviderTenantConfiguration]?
    public var identityProviderType:IdentityProviderType?
    public var identityProviderUserId:String?
    public var user:User?
    public var username:String?
    
    public init(displayName: String? = nil, email: String? = nil, identityProviderId: UUID? = nil, identityProviderLinks: [IdentityProviderLink]? = nil, identityProviderName: String? = nil, identityProviderTenantConfiguration: [IdentityProviderTenantConfiguration]? = nil, identityProviderType: IdentityProviderType? = nil, identityProviderUserId: String? = nil, user: User? = nil, username: String? = nil) {
        self.displayName = displayName
        self.email = email
        self.identityProviderId = identityProviderId
        self.identityProviderLinks = identityProviderLinks
        self.identityProviderName = identityProviderName
        self.identityProviderTenantConfiguration = identityProviderTenantConfiguration
        self.identityProviderType = identityProviderType
        self.identityProviderUserId = identityProviderUserId
        self.user = user
        self.username = username
    }
}
