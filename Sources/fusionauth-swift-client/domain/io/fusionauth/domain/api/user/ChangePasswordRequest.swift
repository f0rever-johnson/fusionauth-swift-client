//
//  ChangePasswordRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class ChangePasswordRequest:BaseEventRequest {
    public var currentPassword:String?
    public var loginId:String?
    public var password:String?
    public var refreshToken:String?

    public init(currentPassword: String? = nil, eventInfo: EventInfo? = nil, loginId: String? = nil, password: String? = nil, refreshToken: String? = nil) {
        self.currentPassword = currentPassword
        self.loginId = loginId
        self.password = password
        self.refreshToken = refreshToken
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentPassword = try container.decode(String.self, forKey: .currentPassword)
        self.loginId = try container.decode(String.self, forKey: .loginId)
        self.password = try container.decode(String.self, forKey: .password)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(currentPassword, forKey: .currentPassword)
        try container.encode(loginId, forKey: .loginId)
        try container.encode(password, forKey: .password)
        try container.encode(refreshToken, forKey: .refreshToken)
        
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case currentPassword
        case loginId
        case password
        case refreshToken
    }

}
