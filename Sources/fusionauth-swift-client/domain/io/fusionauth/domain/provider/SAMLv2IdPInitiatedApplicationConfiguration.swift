//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

public class SAMLv2IdPInitiatedApplicationConfiguration: BaseIdentityProviderApplicationConfiguration{
    
    public var createRegistration: Bool?
    public var data: [String : JSONObject]?
    public var enabled: Bool?
    
    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
    }
    
    
}
