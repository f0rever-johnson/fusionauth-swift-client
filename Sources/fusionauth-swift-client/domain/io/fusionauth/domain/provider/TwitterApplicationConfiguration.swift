//
//  TwitterApplicationConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Twitter Application Configuration Object.
 */

public class TwitterApplicationConfiguration:BaseIdentityProviderApplicationConfiguration {
    public var createRegistration: Bool? = nil
    public var data: [String : JSONObject]? = nil
    public var enabled: Bool? = nil
    public var buttonText:String? = nil
    public var consumerKey:String? = nil
    public var consumerSecret:String? = nil

    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, buttonText: String? = nil, consumerKey: String? = nil, consumerSecret: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.buttonText = buttonText
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
    }

}
