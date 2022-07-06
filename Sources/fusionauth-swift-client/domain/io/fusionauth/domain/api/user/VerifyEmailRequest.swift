//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class VerifyEmailRequest:BaseEventRequest{
  
    public var oneTimeCode:String?
    public var userId:UUID?
    public var verificationId:String?
    
    public init(eventInfo: EventInfo? = nil, oneTimeCode: String? = nil, userId:UUID? = nil, verificationId: String? = nil) {
        self.oneTimeCode = oneTimeCode
        self.userId = userId
        self.verificationId = verificationId
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.oneTimeCode = try container.decode(String.self, forKey: .oneTimeCode)
        self.userId = try container.decode(UUID.self,   forKey: .userId)
        self.verificationId = try container.decode(String.self, forKey: .verificationId)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
            
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(oneTimeCode, forKey: .oneTimeCode)
        try container.encode(userId, forKey: .userId)
        try container.encode(verificationId, forKey: .verificationId)
            
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case oneTimeCode
        case userId
        case verificationId
    }
}
