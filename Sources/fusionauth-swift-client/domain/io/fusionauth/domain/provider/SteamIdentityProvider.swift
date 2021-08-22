//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct SteamIdentityProvider:Codable, BaseIdentityProvider{
    
    public typealias D = SteamApplicationConfiguration
    
    //BaseIdentityProvider protocol requirements
    public var applicationConfiguration: [String : SteamApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil
    public var linkingStrategy: IdentityProviderLinkingStrategy? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    
    public var buttonText:String? = nil
    public var clientId:String? = nil
    public var scope:String? = nil
    public var webAPIKey:String? = nil
    
    public init(applicationConfiguration: [String : SteamApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, linkingStrategy: IdentityProviderLinkingStrategy? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonText: String? = nil, clientId: String? = nil, scope: String? = nil, webAPIKey: String? = nil) {
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
        self.buttonText = buttonText
        self.clientId = clientId
        self.scope = scope
        self.webAPIKey = webAPIKey
    }
    
}