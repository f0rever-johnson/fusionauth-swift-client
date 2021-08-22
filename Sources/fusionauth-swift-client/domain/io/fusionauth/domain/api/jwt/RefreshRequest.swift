//
//  RefreshRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class RefreshRequest:BaseEventRequest{

    public var refreshToken:String? = nil
    public var token:String? = nil
    
    public init(eventInfo: EventInfo? = nil, refreshToken: String? = nil, token: String? = nil) {
        self.refreshToken = refreshToken
        self.token = token
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
        self.token = try container.decode(String.self, forKey: .token)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case refreshToken
        case token
    }
    
    
}
