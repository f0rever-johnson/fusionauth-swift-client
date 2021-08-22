//
//  TwoFactorLoginRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class TwoFactorLoginRequest:BaseLoginRequest{
 
    public var code:String? = nil
    public var trustComputer:Bool? = nil
    public var twoFactorId:String? = nil
    public var userId:UUID? = nil
    
    public init(code: String? = nil, trustComputer: Bool? = nil, twoFactorId: String? = nil, userId: UUID? = nil) {
        self.code = code
        self.trustComputer = trustComputer
        self.twoFactorId = twoFactorId
        self.userId = userId
        super.init()
    }

    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(String.self, forKey: .code)
        trustComputer = try container.decode(Bool.self, forKey: .trustComputer)
        twoFactorId = try container.decode(String.self, forKey: .twoFactorId)
        userId = try container.decode(UUID.self, forKey: .userId)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }

    private enum CodingKeys:CodingKey{
        case code
        case trustComputer
        case twoFactorId
        case userId
    }
}
