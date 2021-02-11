//
//  IdentityProviderOAuth2Configuration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Identity Provider OAuth2 Configuration Object.
 */

public class IdentityProviderOAuth2Configuration:Codable {
    
    public var authorizationEndpoint:String? = nil
    public var clientAuthenticationMethod:ClientAuthenticationMethod? = nil
    public var clientId:String? = nil
    public var clientSecret:String? = nil
    public var emailClaim:String? = nil
    public var issuer:String? = nil
    public var scope:String? = nil
    public var tokenEndpoint:String? = nil
    public var userinfoEndpoint:String? = nil

    public init(authorizationEndpoint: String? = nil, clientAuthenticationMethod: ClientAuthenticationMethod? = nil, clientId: String? = nil, clientSecret: String? = nil, emailClaim: String? = nil, issuer: String? = nil, scope: String? = nil, tokenEndpoint: String? = nil, userinfoEndpoint: String? = nil) {
        self.authorizationEndpoint = authorizationEndpoint
        self.clientAuthenticationMethod = clientAuthenticationMethod
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.emailClaim = emailClaim
        self.issuer = issuer
        self.scope = scope
        self.tokenEndpoint = tokenEndpoint
        self.userinfoEndpoint = userinfoEndpoint
    }
  

    private enum CodingKeys:String, CodingKey{
        case authorizationEndpoint = "authorizationEndpoint"
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case issuer
        case scope
        case tokenEndpoint = "token_endpoint"
        case userinfoEndpoint = "userinfo_endpoint"

    }

}
