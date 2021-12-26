//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class AppleIdentityProvider:BaseIdentityProvider, Codable{
    
    public typealias D = AppleApplicationConfiguration

    public var insertinstant: Date? 
    public var lambdaConfiguration: LambdaConfiguration? 
    public var lastUpdateInstant: Date? 
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var applicationConfiguration: [String : AppleApplicationConfiguration]?
    public var data: [String : JSONObject]? 
    public var debug: Bool? 
    public var id: UUID?
    public var name: String?
    public var type: IdentityProviderType?
    public var enabled: Bool?
    public var buttonText:String?
    public var keyId:UUID?
    public var scope:String?
    public var servicesId:String?
    public var teamId:String?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?

    
    public init(insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, applicationConfiguration: [String : AppleApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonText: String? = nil, keyId: UUID? = nil, scope: String? = nil, servicesId: String? = nil, teamId: String? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.linkingStrategy = linkingStrategy
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.name = name
        self.type = type
        self.enabled = enabled
        self.buttonText = buttonText
        self.keyId = keyId
        self.scope = scope
        self.servicesId = servicesId
        self.teamId = teamId
        self.tenantConfiguration = tenantConfiguration
    }
    
}
