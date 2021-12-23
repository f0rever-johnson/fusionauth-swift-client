//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class RefreshTokenRevokeRequest:BaseEventRequest{
    
    public var applicationId:UUID?
    public var token:String?
    public var userId:String?
    
    public init(applicationId: UUID? = nil, eventInfo: EventInfo? = nil, token: String? = nil, userId: String? = nil) {
        self.applicationId = applicationId
        self.token = token
        self.userId = userId
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.applicationId = try container.decode(UUID.self, forKey: .applicationId)
        self.token = try container.decode(String.self, forKey: .token)
        self.token = try container.decode(String.self, forKey: .userId)
        
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    override public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(applicationId, forKey: .applicationId)
        try container.encode(token, forKey: .token)
        try container.encode(userId, forKey: .userId)
            
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case applicationId
        case token
        case userId
    }
}
