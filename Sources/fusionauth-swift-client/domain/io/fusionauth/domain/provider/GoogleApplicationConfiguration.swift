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
    public var createRegistration: Bool? = nil
    public var enabled: Bool? = nil
    public var data: [String : JSONObject]? = nil
    public var buttonText:String? = nil
    public var clientId:String? = nil
    public var clientSecret:String? = nil
    public var scope:String? = nil

    public init(createRegistration: Bool? = nil, enabled: Bool? = nil, data: [String : JSONObject]? = nil, buttonText: String? = nil, clientId: String? = nil, clientSecret: String? = nil, scope: String? = nil) {
        self.createRegistration = createRegistration
        self.enabled = enabled
        self.data = data
        self.buttonText = buttonText
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.scope = scope
    }

    private enum CodingKeys:String, CodingKey{
        case createRegistration
        case enabled
        case data
        case buttonText
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case scope
    }

}
