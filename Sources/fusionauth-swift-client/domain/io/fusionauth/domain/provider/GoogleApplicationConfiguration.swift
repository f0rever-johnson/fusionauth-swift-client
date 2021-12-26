//
//  GoogleApplicationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Google Application Configuration Object.
 */

public class GoogleApplicationConfiguration:BaseIdentityProviderApplicationConfiguration, Codable {

    public var createRegistration: Bool?
    public var enabled: Bool?
    public var data: [String : JSONObject]?
    public var buttonText:String?
    public var clientId:String?
    public var clientSecret:String?
    public var loginMethod:IdentityProviderLoginMethod?
    public var scope:String?

    private enum CodingKeys:String, CodingKey{
        case createRegistration
        case enabled
        case data
        case buttonText
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case scope
    }
    
    public init(createRegistration: Bool? = nil, enabled: Bool? = nil, data: [String : JSONObject]? = nil, buttonText: String? = nil, clientId: String? = nil, clientSecret: String? = nil, loginMethod: IdentityProviderLoginMethod? = nil, scope: String? = nil) {
        self.createRegistration = createRegistration
        self.enabled = enabled
        self.data = data
        self.buttonText = buttonText
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.loginMethod = loginMethod
        self.scope = scope
    }

}
