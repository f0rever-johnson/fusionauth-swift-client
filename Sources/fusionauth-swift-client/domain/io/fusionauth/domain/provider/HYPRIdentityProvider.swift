//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class HYPRIdentityProvider:BaseIdentityProvider, Codable{

    public typealias D = HYPRApplicationConfiguration
    public var applicationConfiguration: [UUID : HYPRApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var relyingPartyApplicationId:String? = nil
    public var relyingPartyURL:String? = nil
    
    public init(applicationConfiguration: [UUID : HYPRApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, relyingPartyApplicationId: String? = nil, relyingPartyURL: String? = nil) {
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.type = type
        self.enabled = enabled
        self.relyingPartyApplicationId = relyingPartyApplicationId
        self.relyingPartyURL = relyingPartyURL
    }
    
    
}
