//
//  SAMLv2ApplicationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class SAMLv2ApplicationConfiguration:BaseIdentityProviderApplicationConfiguration{
    public var createRegistration: Bool?
    public var data: [String : JSONObject]?
    public var enabled: Bool?
    public var buttonImageURL:String?
    public var buttonText:String?

    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, buttonImageURL: String? = nil, buttonText: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.buttonImageURL = buttonImageURL
        self.buttonText = buttonText
    }
}
