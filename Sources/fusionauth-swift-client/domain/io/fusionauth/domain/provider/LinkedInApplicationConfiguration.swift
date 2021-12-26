//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/11/21.
//

import Foundation

public class LinkedInApplicationConfiguration:BaseIdentityProviderApplicationConfiguration{
    public var createRegistration: Bool?
    public var data: [String : JSONObject]?
    public var enabled: Bool?
    public var buttonText:String?
    public var clientId:String?
    public var clientSecret:String?
    public var scope:String?
    public var insertinstant: Date?
    public var lambdaConfiguration: LambdaConfiguration?
    public var lastUpdateInstant: Date?
    
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
