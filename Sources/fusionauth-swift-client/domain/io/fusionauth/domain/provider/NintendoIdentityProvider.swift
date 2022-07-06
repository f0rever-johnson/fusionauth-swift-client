//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct NintendoIdentityProvider:Codable, BaseIdentityProvider{
    
    public typealias D = NintendoApplicationConfiguration
    
    //BaseIdentityProvider protocol requirements
    public var applicationConfiguration: [String : NintendoApplicationConfiguration]?
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
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?

    
    public var buttonText:String?
    public var clientId:String?
    public var clientSecret:String?
    public var emailClaim:String?
    public var scope:String?
    public var uniqueIdClaim:String?
    public var usernameClaim:String?

    public init(applicationConfiguration: [String : NintendoApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil, buttonText: String? = nil, clientId: String? = nil, clientSecret: String? = nil, emailClaim: String? = nil, scope: String? = nil, uniqueIdClaim: String? = nil, usernameClaim: String? = nil) {
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
        self.tenantConfiguration = tenantConfiguration
        self.buttonText = buttonText
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.emailClaim = emailClaim
        self.scope = scope
        self.uniqueIdClaim = uniqueIdClaim
        self.usernameClaim = usernameClaim
    }
}
