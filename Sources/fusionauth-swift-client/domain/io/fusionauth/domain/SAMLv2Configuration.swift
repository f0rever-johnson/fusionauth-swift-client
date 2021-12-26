//
//  SAMLv2Configuration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class SAMLV2Configuration:Enableable, Codable{
 
    public var enabled: Bool?
    public var audience:String?
    public var authorizedRedirectURLS:[String]?
    public var callbackURL:String?
    public var debug:Bool?
    public var defaultVerificationKeyId:UUID?
    public var issuer:String?
    public var keyId:UUID?
    public var logout:SAMLv2Logout?
    public var logoutURL:String?
    public var requireSignedRequests:Bool?
    public var xmlSignatureC14nMethod:CanonicalizationMethod?
    public var xmlSignatureLocation:XMLSignatureLocation?

    public init(enabled: Bool? = nil, audience: String? = nil, authorizedRedirectURLS: [String]? = nil, callbackURL: String? = nil, debug: Bool? = nil, defaultVerificationKeyId: UUID? = nil, issuer: String? = nil, keyId: UUID? = nil, logout:SAMLv2Logout? = nil, logoutURL: String? = nil, requireSignedRequests: Bool? = nil, xmlSignatureC14nMethod: CanonicalizationMethod? = nil, xmlSignatureLocation: XMLSignatureLocation? = nil) {
        self.enabled = enabled
        self.audience = audience
        self.authorizedRedirectURLS = authorizedRedirectURLS
        self.callbackURL = callbackURL
        self.debug = debug
        self.defaultVerificationKeyId = defaultVerificationKeyId
        self.issuer = issuer
        self.keyId = keyId
        self.logout = logout
        self.logoutURL = logoutURL
        self.requireSignedRequests = requireSignedRequests
        self.xmlSignatureC14nMethod = xmlSignatureC14nMethod
        self.xmlSignatureLocation = xmlSignatureLocation
    }
}
