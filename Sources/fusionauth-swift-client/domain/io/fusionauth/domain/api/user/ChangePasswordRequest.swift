//
//  ChangePasswordRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class ChangePasswordRequest:BaseEventRequest {
 
    
    public var applicationId:UUID?
    public var changePasswordId:String?
    public var currentPassword:String?
    public var loginId:String?
    public var password:String?
    public var refreshToken:String?
    public var trustChallenge:String?
    public var trustToken:String?
    
    public init(applicationId: UUID? = nil, changePasswordId: String? = nil, currentPassword: String? = nil, eventInfo:EventInfo? = nil, loginId: String? = nil, password: String? = nil, refreshToken: String? = nil, trustChallenge: String? = nil, trustToken: String? = nil) {
        self.applicationId = applicationId
        self.changePasswordId = changePasswordId
        self.currentPassword = currentPassword
        self.loginId = loginId
        self.password = password
        self.refreshToken = refreshToken
        self.trustChallenge = trustChallenge
        self.trustToken = trustToken
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.applicationId = try container.decode(UUID.self, forKey: .applicationId)
        self.changePasswordId = try container.decode(String.self, forKey: .changePasswordId)
        self.currentPassword = try container.decode(String.self, forKey: .currentPassword)
        self.loginId = try container.decode(String.self, forKey: .loginId)
        self.password = try container.decode(String.self, forKey: .password)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
        self.trustChallenge = try container.decode(String.self, forKey: .trustChallenge)
        self.trustToken = try container.decode(String.self, forKey: .trustToken)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(applicationId, forKey: .applicationId)
        try container.encode(changePasswordId, forKey: .changePasswordId)
        try container.encode(currentPassword, forKey: .currentPassword)
        try container.encode(loginId, forKey: .loginId)
        try container.encode(password, forKey: .password)
        try container.encode(refreshToken, forKey: .refreshToken)
        try container.encode(trustChallenge, forKey: .trustChallenge)
        try container.encode(trustToken, forKey: .trustToken)
        
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case applicationId
        case changePasswordId
        case currentPassword
        case loginId
        case password
        case refreshToken
        case trustChallenge
        case trustToken
    }

}
