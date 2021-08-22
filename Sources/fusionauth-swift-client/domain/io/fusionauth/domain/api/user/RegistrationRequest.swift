//
//  RegistrationRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class RegistrationRequest:BaseEventRequest {
    
    public var disableDomainBlock:Bool?
    public var generateAuthenticationToken:Bool?
    public var registration:UserRegistration?
    public var sendSetPasswordEmail:Bool?
    public var skipRegistrationVerification:Bool?
    public var skipVerification:Bool?
    public var user:User?

    public init(disableDomainBlock: Bool? = nil, eventInfo: EventInfo? = nil, generateAuthenticationToken: Bool? = nil, registration: UserRegistration? = nil, sendSetPasswordEmail: Bool? = nil, skipRegistrationVerification: Bool? = nil, skipVerification: Bool? = nil, user: User? = nil) {
        self.disableDomainBlock = disableDomainBlock
        self.generateAuthenticationToken = generateAuthenticationToken
        self.registration = registration
        self.sendSetPasswordEmail = sendSetPasswordEmail
        self.skipRegistrationVerification = skipRegistrationVerification
        self.skipVerification = skipVerification
        self.user = user
        super.init(eventInfo:eventInfo)
    }

    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.disableDomainBlock = try container.decode(Bool.self, forKey: .disableDomainBlock)
        self.generateAuthenticationToken = try container.decode(Bool.self, forKey: .generateAuthenticationToken)
        self.registration = try container.decode(UserRegistration.self, forKey: .registration)
        self.sendSetPasswordEmail = try container.decode(Bool.self, forKey: .sendSetPasswordEmail)
        self.skipRegistrationVerification = try container.decode(Bool.self, forKey: .skipRegistrationVerification)
        self.skipVerification = try container.decode(Bool.self, forKey: .skipVerification)
        self.user = try container.decode(User.self, forKey: .user)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case disableDomainBlock
        case generateAuthenticationToken
        case registration
        case sendSetPasswordEmail
        case skipRegistrationVerification
        case skipVerification
        case user
    }
}
