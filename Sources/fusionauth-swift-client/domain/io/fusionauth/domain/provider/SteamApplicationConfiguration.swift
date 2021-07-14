//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 7/13/21.
//

import Foundation

public struct SteamApplicationConfiguration:Codable, BaseIdentityProviderApplicationConfiguration{
 
    //BaseIdentityProviderApplicationConfiguration protocol requirements
    public var createRegistration: Bool?
    public var data: [String : JSONObject]?
    public var enabled: Bool?
    
    public var buttonText:String? = nil
    public var clientId:String? = nil
    public var scope:String? = nil
    public var webAPIKey:String? = nil
    
    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, buttonText: String? = nil, clientId: String? = nil, scope: String? = nil, webAPIKey: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.buttonText = buttonText
        self.clientId = clientId
        self.scope = scope
        self.webAPIKey = webAPIKey
    }
}
