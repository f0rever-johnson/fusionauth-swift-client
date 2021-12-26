//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class HYPRIdentityProvider:BaseIdentityProvider, Codable{
   
    public typealias D = HYPRApplicationConfiguration
    
    public var applicationConfiguration: [String : HYPRApplicationConfiguration]?
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
    public var relyingPartyApplicationId:String?
    public var relyingPartyURL:String?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?

    public init(applicationConfiguration: [String : HYPRApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, relyingPartyApplicationId: String? = nil, relyingPartyURL: String? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
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
        self.relyingPartyApplicationId = relyingPartyApplicationId
        self.relyingPartyURL = relyingPartyURL
        self.tenantConfiguration = tenantConfiguration
    }
}
