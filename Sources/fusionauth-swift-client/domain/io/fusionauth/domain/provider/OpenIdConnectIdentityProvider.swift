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
    
    public var applicationConfiguration: [String : OpenIdConnectApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var buttonImageURL:String? = nil
    public var domains:[String]? = nil
    public var lambdaConfiguration:LambdaConfiguration? = nil
    public var oauth2:IdentityProviderOAuth2Configuration? = nil
    public var insertinstant: Date? = nil
    public var lastUpdateInstant: Date? = nil
    
    public init(applicationConfiguration: [String : OpenIdConnectApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonImageURL: String? = nil, domains: [String]? = nil, lambdaConfiguration: LambdaConfiguration? = nil, oauth2: IdentityProviderOAuth2Configuration? = nil, insertinstant: Date? = nil, lastUpdateInstant: Date? = nil) {
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
    }

}
