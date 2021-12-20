//
//  FacebookIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new FacebooK Identity Provider Object.
 */

public class FacebookIdentityProvider:BaseIdentityProvider, Codable{

    public typealias D = FacebookApplicationConfiguration
    
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var applicationConfiguration: [String :D]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var appId:String? = nil
    public var buttonText:String? = nil
    public var clientSecret:String? = nil
    public var fields:String? = nil
    public var loginMethod:IdentityProviderLoginMethod? = nil
    public var name:String? = nil
    public var permissions:String? = nil
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil

    
    private enum CodingKeys:String, CodingKey{
        case applicationConfiguration
        case data
        case debug
        case id
        case type
        case enabled
        case appId
        case buttonText = "buttonText"
        case clientSecret = "client_secret"
        case fields
        case name
        case permissions
    }
    
    public init(insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, applicationConfiguration: [String : FacebookIdentityProvider.D]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, appId: String? = nil, buttonText: String? = nil, clientSecret: String? = nil, fields: String? = nil, loginMethod: IdentityProviderLoginMethod? = nil, name: String? = nil, permissions: String? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.linkingStrategy = linkingStrategy
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.type = type
        self.enabled = enabled
        self.appId = appId
        self.buttonText = buttonText
        self.clientSecret = clientSecret
        self.fields = fields
        self.loginMethod = loginMethod
        self.name = name
        self.permissions = permissions
        self.tenantConfiguration = tenantConfiguration
    }
}
