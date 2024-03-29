//
//  LoginRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class LoginRequest:BaseLoginRequest{
 
    
    public var loginId:String?
    public var password:String?
    public var twoFactorTrustId:String?

    public init(applicationId:UUID?, eventInfo:EventInfo? = nil, ipAddress:String? = nil,  loginId: String? = nil, metaData: MetaData? = nil, newDevice: Bool? = nil, noJWT: Bool? = nil, password: String? = nil, twoFactorTrustId: String? = nil) {
        self.loginId = loginId
        self.password = password
        self.twoFactorTrustId = twoFactorTrustId
        super.init(applicationId: applicationId, eventInfo: eventInfo, ipAddress: ipAddress, metaData: metaData, newDevice: newDevice, noJWT: noJWT)
    }
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        loginId = try container.decode(String.self, forKey: .loginId)
        password = try container.decode(String.self, forKey: .password)
        twoFactorTrustId = try container.decode(String.self, forKey: .twoFactorTrustId)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    override public func encode(to encoder: Encoder) throws {
            
        var container = encoder.container(keyedBy: CodingKeys.self)
            
        try container.encode(loginId, forKey: .loginId)
        try container.encode(password, forKey: .password)
        try container.encode(twoFactorTrustId, forKey: .twoFactorTrustId)
                
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case loginId
        case password
        case twoFactorTrustId
    }
}
