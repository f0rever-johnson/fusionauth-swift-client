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

public class OpenIdConnectApplicationConfiguration:BaseIdentityProviderApplicationConfiguration {
    public var createRegistration: Bool?
    public var data: [String : JSONObject]?
    public var enabled: Bool?
    public var buttonImageURL:URL?
    public var buttonText:String?
    public var oauth2:IdentityProviderOAuth2Configuration?

    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, buttonImageURL: URL? = nil, buttonText: String? = nil, oauth2: IdentityProviderOAuth2Configuration? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.buttonImageURL = buttonImageURL
        self.buttonText = buttonText
        self.oauth2 = oauth2
    }

}
