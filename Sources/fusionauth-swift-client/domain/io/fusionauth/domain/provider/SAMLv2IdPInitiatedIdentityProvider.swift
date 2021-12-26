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

    public var applicationConfiguration: [String : SAMLv2IdPInitiatedApplicationConfiguration]?
    public var data: [String : JSONObject]?
    public var debug: Bool?
    public var id: UUID?
    public var insertinstant: Date?
    public var lambdaConfiguration: LambdaConfiguration?
    public var lastUpdateInstant: Date?
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var name: String?
    public var type: IdentityProviderType?
    public var enabled: Bool?
    public var emailClaim:String?
    public var issuer:String?
    public var keyId:UUID?
    public var useNameIdForEmail:Bool?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?
    
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
