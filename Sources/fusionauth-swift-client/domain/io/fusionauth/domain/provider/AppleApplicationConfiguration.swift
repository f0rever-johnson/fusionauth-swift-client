//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class AppleApplicationConfiguration:BaseIdentityProviderApplicationConfiguration, Codable{
    public var createRegistration: Bool? = nil
    public var data: [String : JSONObject]? = nil
    public var enabled: Bool? = nil
    public var buttonText:String? = nil
    public var keyId:UUID? = nil
    public var scope:String? = nil
    public var servicesId:String? = nil
    public var teamId:String? = nil
    
    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, buttonText: String? = nil, keyId: UUID? = nil, scope: String? = nil, servicesId: String? = nil, teamId: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.buttonText = buttonText
        self.keyId = keyId
        self.scope = scope
        self.servicesId = servicesId
        self.teamId = teamId
    }
}
