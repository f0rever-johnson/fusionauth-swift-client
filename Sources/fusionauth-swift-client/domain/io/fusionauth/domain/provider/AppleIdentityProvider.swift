//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class AppleIdentityProvider:BaseIdentityProvider, Codable{
    public typealias D = AppleApplicationConfiguration

    public var insertinstant: Date?  = nil
    public var lambdaConfiguration: LambdaConfiguration?  = nil
    public var lastUpdateInstant: Date?  = nil
    public var applicationConfiguration: [String : AppleApplicationConfiguration]? = nil
    public var data: [String : JSONObject]?  = nil
    public var debug: Bool?  = nil
    public var id: UUID? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var buttonText:String? = nil
    public var keyId:UUID? = nil
    public var scope:String? = nil
    public var servicesId:String? = nil
    public var teamId:String? = nil
    
    public init(insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, applicationConfiguration: [String : AppleApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonText: String? = nil, keyId: UUID? = nil, scope: String? = nil, servicesId: String? = nil, teamId: String? = nil) {
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
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
    }
}
