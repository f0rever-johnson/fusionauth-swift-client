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

    public var authorizedOriginURLs:[String]? = nil
    public var authorizedRedirectURLs:[String]? = nil
    public var clientId:String? = nil
    public var clientSecret:String? = nil
    public var debug:Bool? = nil
    public var deviceVerificationURL:String? = nil
    public var enabledGrants:[GrantType]? = nil
    public var generateRefreshTokens:Bool? = nil
    public var logoutURL:URL? = nil
    public var requireClientAuthentication:Bool? = nil
    
    public init(authorizedOriginURLs: [String]? = nil, authorizedRedirectURLs: [String]? = nil, clientId: String? = nil, clientSecret: String? = nil, debug: Bool? = nil, deviceVerificationURL: String? = nil, enabledGrants: [GrantType]? = nil, generateRefreshTokens: Bool? = nil, logoutURL: URL? = nil, requireClientAuthentication: Bool? = nil) {
        self.authorizedOriginURLs = authorizedOriginURLs
        self.authorizedRedirectURLs = authorizedRedirectURLs
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.debug = debug
        self.deviceVerificationURL = deviceVerificationURL
        self.enabledGrants = enabledGrants
        self.generateRefreshTokens = generateRefreshTokens
        self.logoutURL = logoutURL
        self.requireClientAuthentication = requireClientAuthentication
    }

   
}
