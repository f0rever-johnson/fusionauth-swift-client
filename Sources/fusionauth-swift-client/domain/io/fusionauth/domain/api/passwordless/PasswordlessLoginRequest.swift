//
//  PasswordlessLoginRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/11/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public class PasswordlessLoginRequest:BaseLoginRequest{
  
    public var code:String? = nil
    public var twoFactorTrustId:String? = nil

    public init(code: String? = nil, twoFactorTrustId: String? = nil) {
        self.code = code
        self.twoFactorTrustId = twoFactorTrustId
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(String.self, forKey: .code)
        twoFactorTrustId = try container.decode(String.self, forKey: .twoFactorTrustId)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case code
        case twoFactorTrustId
    }

}
