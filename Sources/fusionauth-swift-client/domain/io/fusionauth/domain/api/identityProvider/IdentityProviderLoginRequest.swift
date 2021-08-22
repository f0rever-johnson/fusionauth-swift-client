//
//  IdentityProviderLoginRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class IdentityProviderLoginRequest:BaseLoginRequest{
    
    public var encodedJWT:String?
    public var data:[String:String]?
    public var identityProviderId:UUID?
    public var noLink:Bool?
    
    public init(encodedJWT: String? = nil, data: [String : String]? = nil, identityProviderId: UUID? = nil, noLink: Bool? = nil) {
        self.encodedJWT = encodedJWT
        self.data = data
        self.identityProviderId = identityProviderId
        self.noLink = noLink
        super.init()
    }
    
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        encodedJWT = try container.decode(String.self, forKey: .encodedJWT)
        data = try container.decode([String:String].self, forKey: .data)
        identityProviderId = try container.decode(UUID.self, forKey: .identityProviderid)
        noLink = try container.decode(Bool.self, forKey: .noLink)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    
    private enum CodingKeys:CodingKey{
        case encodedJWT
        case data
        case identityProviderid
        case noLink
    }
    
}
