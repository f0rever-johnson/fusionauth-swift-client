//
//  ImportRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class ImportRequest:BaseEventRequest {
    public var encryptionScheme:String? = nil
    public var factor:Int? = nil
    public var users:[User]? = nil
    public var validateDbConstraints:Bool? = nil

    public init(encryptionScheme: String? = nil, eventInfo: EventInfo? = nil, factor: Int? = nil, users: [User]? = nil, validateDbConstraints: Bool? = nil) {
        self.encryptionScheme = encryptionScheme
        self.factor = factor
        self.users = users
        self.validateDbConstraints = validateDbConstraints
        super.init(eventInfo:eventInfo)
    }

    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.encryptionScheme = try container.decode(String.self, forKey: .encryptionScheme )
        self.factor = try container.decode(Int.self, forKey: .factor)
        self.users = try container.decode([User].self, forKey: .users)
        self.validateDbConstraints = try container.decode(Bool.self, forKey: .validateDbConstraints)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    override public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(encryptionScheme, forKey: .encryptionScheme)
        try container.encode(factor, forKey: .factor)
        try container.encode(users, forKey: .users)
        try container.encode(validateDbConstraints, forKey: .validateDbConstraints)
            
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case encryptionScheme
        case factor
        case users
        case validateDbConstraints
    }
}
