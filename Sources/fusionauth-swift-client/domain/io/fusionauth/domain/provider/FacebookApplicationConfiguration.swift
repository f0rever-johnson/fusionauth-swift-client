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

public struct FacebookApplicationConfiguration:BaseIdentityProviderApplicationConfiguration{
    
    public var createRegistration: Bool?
    public var data:[String:JSONObject]? = nil
    public var enabled: Bool? = nil
    public var appId:String? = nil
    public var buttonText:String? = nil
    public var clientSecret:String? = nil
    public var fields:String? = nil
    public var permissions:String? = nil

    public init(createRegistration: Bool?, data: [String:JSONObject]? = nil, enabled: Bool? = nil, appId: String? = nil, buttonText: String? = nil, clientSecret: String? = nil, fields: String? = nil, permissions: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.appId = appId
        self.buttonText = buttonText
        self.clientSecret = clientSecret
        self.fields = fields
        self.permissions = permissions
    }
    
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
}
