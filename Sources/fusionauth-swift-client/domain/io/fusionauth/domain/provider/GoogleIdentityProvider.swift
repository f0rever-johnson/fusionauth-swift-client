//
//  GoogleIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Google Identity Provider Object.
 */

public class GoogleIdentityProvider:BaseIdentityProvider{

    public typealias D = GoogleApplicationConfiguration
    
    public var insertinstant: Date?
    public var lambdaConfiguration: LambdaConfiguration?
    public var lastUpdateInstant: Date?
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var applicationConfiguration: [String : GoogleApplicationConfiguration]?
    public var data: [String : JSONObject]?
    public var debug: Bool?
    public var id: UUID?
    public var name: String?
    public var type: IdentityProviderType?
    public var enabled: Bool?
    public var buttonText:String?
    public var clientId:String?
    public var clientSecret:String?
    public var loginMethod:IdentityProviderLoginMethod?
    public var scope:String?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?


    private enum CodingKeys:String, CodingKey{
        case buttonText
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case scope
        case applicationConfiguration
        case data
        case debug
        case id
        case name
        case type
        case enabled

    }

    public init(insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, applicationConfiguration: [String : GoogleApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonText: String? = nil, clientId: String? = nil, clientSecret: String? = nil, loginMethod: IdentityProviderLoginMethod? = nil, scope: String? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
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
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.loginMethod = loginMethod
        self.scope = scope
        self.tenantConfiguration = tenantConfiguration
    }
    
}
