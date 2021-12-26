//
//  OAuth2Configuration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


/**
 * Creates a new OAuth2 Configuration Object.
 */

public class OAuth2Configuration:Codable{
    
    public var authorizedOriginURLs:[String]?
    public var authorizedRedirectURLs:[String]?
    public var clientAuthenticationPolicy:ClientAuthenticationPolicy?
    public var clientId:String?
    public var clientSecret:String?
    public var debug:Bool?
    public var deviceVerificationURL:String?
    public var enabledGrants:[GrantType]?
    public var generateRefreshTokens:Bool?
    public var logoutURL:URL?
    public var proofKeyForCodeExchangePolicy:ProofKeyForCodeExchangePolicy?
    public var requireClientAuthentication:Bool?
    public var requireRegistration:Bool?
    
    public init(authorizedOriginURLs: [String]? = nil, authorizedRedirectURLs: [String]? = nil, clientAuthenticationPolicy: ClientAuthenticationPolicy? = nil, clientId: String? = nil, clientSecret: String? = nil, debug: Bool? = nil, deviceVerificationURL: String? = nil, enabledGrants: [GrantType]? = nil, generateRefreshTokens: Bool? = nil, logoutURL: URL? = nil, proofKeyForCodeExchangePolicy: ProofKeyForCodeExchangePolicy? = nil, requireClientAuthentication: Bool? = nil, requireRegistration: Bool? = nil) {
        self.authorizedOriginURLs = authorizedOriginURLs
        self.authorizedRedirectURLs = authorizedRedirectURLs
        self.clientAuthenticationPolicy = clientAuthenticationPolicy
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.debug = debug
        self.deviceVerificationURL = deviceVerificationURL
        self.enabledGrants = enabledGrants
        self.generateRefreshTokens = generateRefreshTokens
        self.logoutURL = logoutURL
        self.proofKeyForCodeExchangePolicy = proofKeyForCodeExchangePolicy
        self.requireClientAuthentication = requireClientAuthentication
        self.requireRegistration = requireRegistration
    }


   
}
