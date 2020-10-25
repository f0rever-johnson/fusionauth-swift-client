//
//  OpenIdConnectApplicationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new OpenId Connect Application Configuration Object.
 */

public struct OpenIdConnectApplicationConfiguration:BaseIdentityProviderApplicationConfiguration {
    public var createRegistration: Bool? = nil
    public var data: [String : JSONObject]? = nil
    public var enabled: Bool? = nil
    public var buttonImageURL:URL? = nil
    public var buttonText:String? = nil
    public var oauth2:IdentityProviderOAuth2Configuration? = nil

    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, buttonImageURL: URL? = nil, buttonText: String? = nil, oauth2: IdentityProviderOAuth2Configuration? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.buttonImageURL = buttonImageURL
        self.buttonText = buttonText
        self.oauth2 = oauth2
    }

}
