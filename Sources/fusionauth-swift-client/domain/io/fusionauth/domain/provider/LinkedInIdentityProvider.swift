//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/11/21.
//

import Foundation

public class LinkedInIdentityProvider:BaseIdentityProvider, Codable{
   
    public typealias D = LinkedInApplicationConfiguration
    
    public var enabled: Bool?
    public var applicationConfiguration: [String : LinkedInApplicationConfiguration]?
    public var data: [String : JSONObject]?
    public var name: String?
    public var debug: Bool?
    public var id: UUID?
    public var type: IdentityProviderType?
    public var buttonText:String?
    public var clientId:String?
    public var clientSecret:String?
    public var scope:String?
    public var insertinstant: Date?
    public var lambdaConfiguration: LambdaConfiguration?
    public var lastUpdateInstant: Date?
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?


    private enum CodingKeys:String, CodingKey{
        case buttonText
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case scope
    }
    
    public init(enabled: Bool? = nil, applicationConfiguration: [String : LinkedInApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, name: String? = nil, debug: Bool? = nil, id: UUID? = nil, type: IdentityProviderType? = nil, buttonText: String? = nil, clientId: String? = nil, clientSecret: String? = nil, scope: String? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
        self.enabled = enabled
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.name = name
        self.debug = debug
        self.id = id
        self.type = type
        self.buttonText = buttonText
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.scope = scope
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.linkingStrategy = linkingStrategy
        self.tenantConfiguration = tenantConfiguration
    }
    
}
