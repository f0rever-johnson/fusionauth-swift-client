//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 2/11/21.
//

import Foundation

public class LinkedInIdentityProvider:BaseIdentityProvider, Codable{
   
    public typealias D = LinkedInApplicationConfiguration
    
    public var enabled: Bool?
    public var applicationConfiguration: [String : LinkedInApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var name: String? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var type: IdentityProviderType? = nil
    public var buttonText:String? = nil
    public var clientId:String? = nil
    public var clientSecret:String? = nil
    public var scope:String? = nil
    public var insertinstant: Date? = nil
    public var lambdaConfiguration: LambdaConfiguration? = nil
    public var lastUpdateInstant: Date? = nil
    
    public init(enabled: Bool? = nil, applicationConfiguration: [String : LinkedInApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, name: String? = nil, debug: Bool? = nil, id: UUID? = nil, type: IdentityProviderType? = nil, buttonText: String? = nil, clientId: String? = nil, clientSecret: String? = nil, scope: String? = nil, insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil) {
        self.enabled = enabled
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.name = name
        self.debug = debug
        self.id = id
        self.type = type
        self.buttonText = buttonText
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.scope = scope
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
    }

    private enum CodingKeys:String, CodingKey{
        case buttonText
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case scope
    }

}
