//
//  ExternalJWTApplicationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class ExternalJWTApplicationConfiguration:BaseIdentityProviderApplicationConfiguration, Codable {
    public var enabled: Bool?
    public var createRegistration: Bool?
    public var data: [String:JSONObject]?

    public init(enabled: Bool? = nil, createRegistration: Bool? = nil, data: [String:JSONObject]? = nil) {
        self.enabled = enabled
        self.createRegistration = createRegistration
        self.data = data
    }
}
