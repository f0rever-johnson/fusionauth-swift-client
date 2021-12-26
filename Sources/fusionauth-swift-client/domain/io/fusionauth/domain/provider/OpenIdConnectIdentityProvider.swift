//
//  OpenIdConnectIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new OpenId Connect Identity Provider Object.
 */

public class OpenIdConnectIdentityProvider:BaseIdentityProvider {

    public typealias D = OpenIdConnectApplicationConfiguration
    
    public var applicationConfiguration: [String : OpenIdConnectApplicationConfiguration]?
    public var data: [String : JSONObject]?
    public var debug: Bool?
    public var id: UUID?
    public var name: String?
    public var type: IdentityProviderType?
    public var enabled: Bool?
    public var buttonImageURL:String?
    public var domains:[String]?
    public var lambdaConfiguration:LambdaConfiguration?
    public var oauth2:IdentityProviderOAuth2Configuration?
    public var insertinstant: Date?
    public var lastUpdateInstant: Date?
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?

    
    public init(applicationConfiguration: [String : OpenIdConnectApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonImageURL: String? = nil, domains: [String]? = nil, lambdaConfiguration: LambdaConfiguration? = nil, oauth2: IdentityProviderOAuth2Configuration? = nil, insertinstant: Date? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.name = name
        self.type = type
        self.enabled = enabled
        self.buttonImageURL = buttonImageURL
        self.domains = domains
        self.lambdaConfiguration = lambdaConfiguration
        self.oauth2 = oauth2
        self.insertinstant = insertinstant
        self.lastUpdateInstant = lastUpdateInstant
        self.linkingStrategy = linkingStrategy
        self.tenantConfiguration = tenantConfiguration
    }
}
