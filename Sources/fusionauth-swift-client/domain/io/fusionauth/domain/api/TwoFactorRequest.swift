//
//  TwoFactorRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class TwoFactorRequest:BaseEventRequest {
    public var applicationId:UUID?
    public var authenticatorId:String?
    public var code:String?
    public var email:String?
    public var method:String?
    public var mobilePhone:String?
    public var secret:String?
    public var secretBase32Encoded:String?
    
    public init(applicationId:UUID? = nil, authenticatorId: String? = nil, code: String? = nil, email: String? = nil, eventInfo: EventInfo? = nil, method: String? = nil, mobilePhone: String? = nil, secret: String? = nil, secretBase32Encoded: String? = nil) {
        self.applicationId = applicationId
        self.authenticatorId = authenticatorId
        self.code = code
        self.email = email
        self.method = method
        self.mobilePhone = mobilePhone
        self.secret = secret
        self.secretBase32Encoded = secretBase32Encoded
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.applicationId = try container.decode(UUID.self, forKey: .applicationId)
        self.authenticatorId = try container.decode(String.self, forKey: .authenticatorId)
        self.code = try container.decode(String.self, forKey: .code)
        self.email = try container.decode(String.self, forKey: .email)
        self.mobilePhone = try container.decode(String.self, forKey: .mobilePhone)
        self.secret = try container.decode(String.self, forKey: .secret)
        self.secretBase32Encoded = try container.decode(String.self, forKey: .secretBase32Encoded)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case applicationId
        case authenticatorId
        case code
        case email
        case method
        case mobilePhone
        case secret
        case secretBase32Encoded
    }

}
