//
//  ForgotPasswordRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class ForgotPasswordRequest:BaseEventRequest {
    public var changePasswordId:String?
    public var email:String?
    public var loginId:String?
    public var sendForgotPasswordEmail:Bool?
    public var state:[String:JSONObject]?
    public var username:String?

    public init(changePasswordId: String? = nil, email: String? = nil, eventInfo: EventInfo? = nil, loginId: String? = nil, sendForgotPasswordEmail: Bool? = nil, state: [String:JSONObject]? = nil, username: String? = nil) {
        self.changePasswordId = changePasswordId
        self.email = email
        self.loginId = loginId
        self.sendForgotPasswordEmail = sendForgotPasswordEmail
        self.state = state
        self.username = username
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.changePasswordId = try container.decode(String.self, forKey: .changePasswordId)
        self.email = try container.decode(String.self, forKey: .email)
        self.loginId = try container.decode(String.self, forKey: .loginId)
        self.sendForgotPasswordEmail = try container.decode(Bool.self, forKey: .sendForgotPasswordEmail)
        self.state = try container.decode([String:JSONObject].self, forKey: .state)
        self.username = try container.decode(String.self, forKey: .username)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(changePasswordId, forKey: .changePasswordId)
        try container.encode(email, forKey: .email)
        try container.encode(loginId, forKey: .loginId)
        try container.encode(sendForgotPasswordEmail, forKey: .sendForgotPasswordEmail)
        try container.encode(state, forKey: .state)
        try container.encode(username, forKey: .username)
        
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case changePasswordId
        case email
        case loginId
        case sendForgotPasswordEmail
        case state
        case username
    }
}
