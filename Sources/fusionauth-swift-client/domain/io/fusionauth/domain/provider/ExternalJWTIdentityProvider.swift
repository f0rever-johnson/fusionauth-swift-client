//
//  ExternalJWTIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new External JWT Identity Provider Object.
 */

public class ExternalJWTIdentityProvider:BaseIdentityProvider, Codable{
   
    public typealias D = ExternalJWTApplicationConfiguration
    
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil
    public var name: String? = nil
    public var applicationConfiguration: [String : ExternalJWTApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var enabled: Bool? = nil
    public var claimMap:[String:String]? = nil
    public var domains:[String]? = nil
    public var headerKeyParameter:String? = nil
    public var keys:[String:String]? = nil
    public var oauth2:IdentityProviderOAuth2Configuration? = nil
    public var uniqueIdentityClaim:String? = nil
    public var type:IdentityProviderType? = nil
    
    public init(insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, applicationConfiguration: [String : ExternalJWTApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, enabled: Bool? = nil, claimMap: [String : String]? = nil, domains: [String]? = nil, headerKeyParameter: String? = nil, keys: [String : String]? = nil, oauth2: IdentityProviderOAuth2Configuration? = nil, uniqueIdentityClaim: String? = nil, type: IdentityProviderType? = nil) {
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.enabled = enabled
        self.claimMap = claimMap
        self.domains = domains
        self.headerKeyParameter = headerKeyParameter
        self.keys = keys
        self.oauth2 = oauth2
        self.uniqueIdentityClaim = uniqueIdentityClaim
        self.type = type
    }

}
