//
//  GoogleIdentityProvider.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Google Identity Provider Object.
 */

public struct GoogleIdentityProvider:BaseIdentityProvider{

    public typealias D = GoogleApplicationConfiguration
    
    public var insertinstant: Date?
    public var lambdaConfiguration: LambdaConfiguration?
    public var lastUpdateInstant: Date?
    public var applicationConfiguration: [UUID : GoogleApplicationConfiguration]? = nil
    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var name: String? = nil
    public var type: IdentityProviderType? = nil
    public var enabled: Bool? = nil
    public var buttonText:String? = nil
    public var clientId:String? = nil
    public var clientSecret:String? = nil
    public var scope:String? = nil

    public init(insertinstant: Date? = nil, lambdaConfiguration: LambdaConfiguration? = nil, lastUpdateInstant: Date? = nil, applicationConfiguration: [UUID : GoogleApplicationConfiguration]? = nil, data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, name: String? = nil, type: IdentityProviderType? = nil, enabled: Bool? = nil, buttonText: String? = nil, clientId: String? = nil, clientSecret: String? = nil, scope: String? = nil) {
        self.insertinstant = insertinstant
        self.lambdaConfiguration = lambdaConfiguration
        self.lastUpdateInstant = lastUpdateInstant
        self.applicationConfiguration = applicationConfiguration
        self.data = data
        self.debug = debug
        self.id = id
        self.name = name
        self.type = type
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
        case applicationConfiguration
        case data
        case debug
        case id
        case name
        case type
        case enabled

    }

}
