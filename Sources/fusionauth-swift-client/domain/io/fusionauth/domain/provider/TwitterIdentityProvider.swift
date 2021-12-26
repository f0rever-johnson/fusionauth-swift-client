//
//  TwitterIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

/**
 * Creates a new Twitter Identity Provider Object.
 */

public class TwitterIdentityProvider:BaseIdentityProvider{

    public typealias D = TwitterApplicationConfiguration
    
    public var applicationConfiguration: [String : TwitterApplicationConfiguration]?
    public var data: [String : JSONObject]?
    public var debug: Bool?
    public var id: UUID?
    public var name: String?
    public var type: IdentityProviderType?
    public var enabled: Bool?
    public var buttonText:String?
    public var consumerKey:String?
    public var consumerSecret:String?
    public var insertinstant: Date?
    public var lambdaConfiguration: LambdaConfiguration?
    public var lastUpdateInstant: Date?
    public var linkingStrategy: IdentityProviderLinkingStrategy?
    public var tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]?

    public init(applicationConfiguration: [String : TwitterApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonText: String? = nil, consumerKey: String? = nil, consumerSecret: String? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, tenantConfiguration: [UUID : IdentityProviderTenantConfiguration]? = nil) {
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.name = name
        self.type = type
        self.enabled = enabled
        self.buttonText = buttonText
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.linkingStrategy = linkingStrategy
        self.tenantConfiguration = tenantConfiguration
    }

}
