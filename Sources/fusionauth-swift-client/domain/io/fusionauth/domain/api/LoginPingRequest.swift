//
//  ApplicationEvent.swift
//  FusionAuth Swift Client
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
   * Login Ping API request object.
*/


public class LoginPingRequest:BaseLoginRequest{
   
    public var userId:UUID?
    
    public init(eventInfo:EventInfo, userId: UUID? = nil) {
        self.userId = userId
        super.init(eventInfo: eventInfo)
    }
    
    required init(from decoder: Decoder) throws {
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decode(UUID.self, forKey: .userId)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        
        try super.encode(to: encoder)
    }
    
    public enum CodingKeys:CodingKey{
        case userId
    }
}
