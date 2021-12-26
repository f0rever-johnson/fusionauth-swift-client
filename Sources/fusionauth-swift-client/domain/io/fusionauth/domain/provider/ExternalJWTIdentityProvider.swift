//
//  ExternalJWTIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new External JWT Identity Provider Object.
 */

public class ExternalJWTIdentityProvider:BaseIdentityProvider, Codable{

    public typealias D = ExternalJWTApplicationConfiguration
    
    public var insertinstant: Date?
    public var lambdaConfiguration: LambdaConfiguration?
    public var lastUpdateInstant: Date?
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var name: String?
    public var applicationConfiguration: [String : ExternalJWTApplicationConfiguration]?
    public var data: [String : JSONObject]?
    public var debug: Bool?
    public var id: UUID?
    public var enabled: Bool?
    public var claimMap:[String:String]?
    public var domains:[String]?
    public var headerKeyParameter:String?
    public var keys:[String:String]?
    public var oauth2:IdentityProviderOAuth2Configuration?
    public var uniqueIdentityClaim:String?
    public var type:IdentityProviderType?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?

    public init(insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, name: String? = nil, applicationConfiguration: [String : ExternalJWTApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, enabled: Bool? = nil, claimMap: [String : String]? = nil, domains: [String]? = nil, headerKeyParameter: String? = nil, keys: [String : String]? = nil, oauth2: IdentityProviderOAuth2Configuration? = nil, uniqueIdentityClaim: String? = nil, type: IdentityProviderType? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.linkingStrategy = linkingStrategy
        self.name = name
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.enabled = enabled
        self.claimMap = claimMap
        self.domains = domains
        self.headerKeyParameter = headerKeyParameter
        self.keys = keys
        self.oauth2 = oauth2
        self.uniqueIdentityClaim = uniqueIdentityClaim
        self.type = type
        self.tenantConfiguration = tenantConfiguration
    }
}
