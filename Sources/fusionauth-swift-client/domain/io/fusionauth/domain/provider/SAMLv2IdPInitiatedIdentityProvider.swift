//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///SAML v2 IdP Initiated identity provider configuration.

public class SAMLv2IdPInitiatedIdentityProvider:BaseIdentityProvider, Codable{

    public typealias D = SAMLv2IdPInitiatedApplicationConfiguration

    public var applicationConfiguration: [String : SAMLv2IdPInitiatedApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil
    public var linkingStrategy: IdentityProviderLinkingStrategy? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var emailClaim:String? = nil
    public var issuer:String? = nil
    public var keyId:UUID? = nil
    public var useNameIdForEmail:Bool? = nil
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil
    
    public init(applicationConfiguration: [String : SAMLv2IdPInitiatedApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, emailClaim: String? = nil, issuer: String? = nil, keyId: UUID? = nil, useNameIdForEmail: Bool? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.linkingStrategy = linkingStrategy
        self.name = name
        self.type = type
        self.enabled = enabled
        self.emailClaim = emailClaim
        self.issuer = issuer
        self.keyId = keyId
        self.useNameIdForEmail = useNameIdForEmail
        self.tenantConfiguration = tenantConfiguration
    }
 
}
