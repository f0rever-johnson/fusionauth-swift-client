//
//  ExternalJWTApplicationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class ExternalJWTApplicationConfiguration:BaseIdentityProviderApplicationConfiguration {
    public var enabled: Bool? = nil
    public var createRegistration: Bool? = nil
    public var data: [String:JSONObject]? = nil

    public init(enabled: Bool? = nil, createRegistration: Bool? = nil, data: [String:JSONObject]? = nil) {
        self.enabled = enabled
        self.createRegistration = createRegistration
        self.data = data
    }
}
