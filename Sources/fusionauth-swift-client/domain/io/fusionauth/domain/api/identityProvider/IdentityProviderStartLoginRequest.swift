//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class IdentityProviderStartLoginRequest:BaseLoginRequest{

    public var data:[String:String]?
    public var identityProviderId:UUID?
    public var loginId:String?
    public var state:[String:JSONObject]?
    
    public init(data: [String : String]? = nil, identityProviderId: UUID? = nil, loginId: String? = nil, state: [String : JSONObject]? = nil) {
        self.data = data
        self.identityProviderId = identityProviderId
        self.loginId = loginId
        self.state = state
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([String:String].self, forKey: .data)
        identityProviderId = try container.decode(UUID.self, forKey: .identityProviderId)
        loginId = try container.decode(String.self, forKey: .loginId)
        state = try container.decode([String:JSONObject].self, forKey: .state)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    override public func encode(to encoder: Encoder) throws {
            
        var container = encoder.container(keyedBy: CodingKeys.self)
            
        try container.encode(data, forKey: .data)
        try container.encode(identityProviderId, forKey: .identityProviderId)
        try container.encode(loginId, forKey: .loginId)
        try container.encode(state, forKey: .state)        
                
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case data
        case identityProviderId
        case loginId
        case state
    }
    

    
    
    
}
