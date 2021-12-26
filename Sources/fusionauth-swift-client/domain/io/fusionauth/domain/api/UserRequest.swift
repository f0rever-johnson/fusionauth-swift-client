//
//  UserRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class UserRequest:BaseEventRequest{

    public var applicationId:UUID?
    public var disableDomainBlock:UUID?
    public var sendSetPasswordEmail:Bool?
    public var skipVerification:Bool?
    public var user:User?

    public init(applicationId: UUID? = nil, eventInfo: EventInfo? = nil, disableDomainBlock: UUID? = nil, sendSetPasswordEmail: Bool? = nil, skipVerification: Bool? = nil, user: User? = nil) {
        self.applicationId = applicationId
        self.disableDomainBlock = disableDomainBlock
        self.sendSetPasswordEmail = sendSetPasswordEmail
        self.skipVerification = skipVerification
        self.user = user
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.applicationId = try container.decode(UUID.self, forKey: .applicationId)
        self.disableDomainBlock = try container.decode(UUID.self, forKey: .disableDomainBlock)
        self.sendSetPasswordEmail = try container.decode(Bool.self, forKey: .sendSetPasswordEmail)
        self.skipVerification = try container.decode(Bool.self, forKey: .skipVerification)
        self.user = try container.decode(User.self, forKey: .user)
        
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    override public func encode(to encoder: Encoder) throws {
            
        var container = encoder.container(keyedBy: CodingKeys.self)
            
        try container.encode(applicationId, forKey: .applicationId)
        try container.encode(disableDomainBlock, forKey: .disableDomainBlock)
        try container.encode(sendSetPasswordEmail, forKey: .sendSetPasswordEmail)
        try container.encode(skipVerification, forKey: .skipVerification)
        try container.encode(user, forKey: .user)
        
        try super.encode(to: encoder)
        }
    
    private enum CodingKeys:CodingKey{
        case applicationId
        case disableDomainBlock
        case sendSetPasswordEmail
        case skipVerification
        case user
    }
}
