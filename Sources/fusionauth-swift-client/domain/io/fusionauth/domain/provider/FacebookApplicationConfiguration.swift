//
//  FacebookApplicationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Facebook Application Configuration Object.
 */

public class FacebookApplicationConfiguration:BaseIdentityProviderApplicationConfiguration, Codable{
 
    public var createRegistration: Bool?
    public var data:[String:JSONObject]?
    public var enabled: Bool?
    public var appId:String?
    public var buttonText:String?
    public var clientSecret:String?
    public var fields:String?
    public var loginMethods:IdentityProviderLoginMethod?
    public var permissions:String?
    
    private enum CodingKeys:String, CodingKey{
        case createRegistration
        case data
        case enabled
        case appId
        case buttonText
        case clientSecret = "client_secret"
        case fields
        case permissions
    }
    
    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, appId: String? = nil, buttonText: String? = nil, clientSecret: String? = nil, fields: String? = nil, loginMethods: IdentityProviderLoginMethod? = nil, permissions: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.appId = appId
        self.buttonText = buttonText
        self.clientSecret = clientSecret
        self.fields = fields
        self.loginMethods = loginMethods
        self.permissions = permissions
    }
}
