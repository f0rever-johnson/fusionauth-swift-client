//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

public class SAMLv2Logout:Codable{
    
    public var behavior:SAMLLogoutBehavior?
    public var defaultVerificationKeyId:UUID?
    public var requireSignedRequests:Bool?
    public var singleLogout:SAMLv2SingleLogout?
    public var xmlSignatureC14nMethod:CanonicalizationMethod?
    
    public init(behavior: SAMLLogoutBehavior? = nil, defaultVerificationKeyId: UUID? = nil, requireSignedRequests: Bool? = nil, singleLogout:SAMLv2SingleLogout? = nil, xmlSignatureC14nMethod: CanonicalizationMethod? = nil) {
        self.behavior = behavior
        self.defaultVerificationKeyId = defaultVerificationKeyId
        self.requireSignedRequests = requireSignedRequests
        self.singleLogout = singleLogout
        self.xmlSignatureC14nMethod = xmlSignatureC14nMethod
    }
    
    
    
    
    
    
    
    
}
