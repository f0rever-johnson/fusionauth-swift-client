//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class AppleApplicationConfiguration:BaseIdentityProviderApplicationConfiguration, Codable{
    public var createRegistration: Bool?
    public var data: [String : JSONObject]?
    public var enabled: Bool?
    public var buttonText:String?
    public var keyId:UUID?
    public var scope:String?
    public var servicesId:String?
    public var teamId:String?
    
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
