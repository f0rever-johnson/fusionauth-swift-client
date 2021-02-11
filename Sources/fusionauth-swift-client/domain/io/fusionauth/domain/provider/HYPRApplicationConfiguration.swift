//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation


public class HYPRApplicationConfiguration:BaseIdentityProviderApplicationConfiguration{
    public var createRegistration: Bool? = nil
    public var data: [String : JSONObject]? = nil
    public var enabled: Bool? = nil
    public var relyingPartyApplicationId:String? = nil
    public var relyingPartyURL:String? = nil
    
    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, relyingPartyApplicationId: String? = nil, relyingPartyURL: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.relyingPartyApplicationId = relyingPartyApplicationId
        self.relyingPartyURL = relyingPartyURL
    }
    
    
    
    
    
}

