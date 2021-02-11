//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/11/21.
//

import Foundation

public class LinkedInApplicationConfiguration:BaseIdentityProviderApplicationConfiguration{
    public var createRegistration: Bool? = nil
    public var data: [String : JSONObject]? = nil
    public var enabled: Bool? = nil
    public var buttonText:String? = nil
    public var clientId:String? = nil
    public var clientSecret:String? = nil
    public var scope:String? = nil
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil
    
    public init(createRegistration: Bool? = nil, data: [String : JSONObject]? = nil, enabled: Bool? = nil, buttonText: String? = nil, clientId: String? = nil, clientSecret: String? = nil, scope: String? = nil) {
        self.createRegistration = createRegistration
        self.data = data
        self.enabled = enabled
        self.buttonText = buttonText
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.scope = scope
    }
    

    
    private enum CodingKeys:String, CodingKey{
        case buttonText
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case scope
    }
    
}
