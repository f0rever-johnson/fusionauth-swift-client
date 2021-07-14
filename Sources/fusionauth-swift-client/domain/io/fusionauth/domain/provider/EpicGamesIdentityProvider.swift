//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct EpicGamesIdentityProvider: Codable, BaseIdentityProvider{
    
    public typealias D = EpicGamesApplicationConfiguration
    
    //BaseIdentityProvider Protocol Requirements
    public var applicationConfiguration: [String : EpicGamesApplicationConfiguration]? = nil
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
    public var clientSecret:String? = nil
    public var scope:String? = nil
}
