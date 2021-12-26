//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation


public class HYPRApplicationConfiguration:BaseIdentityProviderApplicationConfiguration, Codable{
    public var createRegistration: Bool?
    public var data: [String : JSONObject]?
    public var enabled: Bool?
    public var relyingPartyApplicationId:String?
    public var relyingPartyURL:String?
    
    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, relyingPartyApplicationId: String? = nil, relyingPartyURL: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.relyingPartyApplicationId = relyingPartyApplicationId
        self.relyingPartyURL = relyingPartyURL
    }
    
    
    
    
    
}

