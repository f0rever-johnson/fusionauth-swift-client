//
//  SAMLv2Configuration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class SAMLV2Configuration:Enableable, Codable{
    public var enabled: Bool? = nil
    public var audience:String? = nil
    public var authorizedRedirectURLS:[String]? = nil
    public var callbackURL:String? = nil
    public var debug:Bool? = nil
    public var defaultVerificationKeyId:UUID? = nil
    public var issuer:String? = nil
    public var keyId:UUID? = nil
    public var logoutURL:String? = nil
    public var requireSignedRequests:Bool? = nil
    public var xmlSignatureC14nMethod:CanonicalizationMethod? = nil
    public var xmlSignatureLocation:XMLSignatureLocation? = nil
    
    public init(enabled: Bool? = nil, audience: String? = nil, authorizedRedirectURLS: [String]? = nil, callbackURL: String? = nil, debug: Bool? = nil, defaultVerificationKeyId: UUID? = nil, issuer: String? = nil, keyId: UUID? = nil, logoutURL: String? = nil, requireSignedRequests: Bool? = nil, xmlSignatureC14nMethod: CanonicalizationMethod? = nil, xmlSignatureLocation:XMLSignatureLocation? = nil) {
        self.enabled = enabled
        self.audience = audience
        self.authorizedRedirectURLS = authorizedRedirectURLS
        self.callbackURL = callbackURL
        self.debug = debug
        self.defaultVerificationKeyId = defaultVerificationKeyId
        self.issuer = issuer
        self.keyId = keyId
        self.logoutURL = logoutURL
        self.requireSignedRequests = requireSignedRequests
        self.xmlSignatureC14nMethod = xmlSignatureC14nMethod
        self.xmlSignatureLocation = xmlSignatureLocation
    }

}
