//
//  ApplicationRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class ApplicationRequest:BaseEventRequest{
    public var application:Application?
    public var webhookIds:[UUID]?
    public var role:ApplicationRole?

    public init(application: Application? = nil, eventInfo:EventInfo? = nil, webhookIds: [UUID]? = nil, role: ApplicationRole? = nil) {
        self.application = application
        self.webhookIds = webhookIds
        self.role = role
        super.init(eventInfo: eventInfo)
    }
    
    required init(from decoder: Decoder) throws {
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        application = try container.decode(Application.self, forKey: .application)
        webhookIds = try container.decode([UUID].self, forKey: .webhookIds)
        role = try container.decode(ApplicationRole.self, forKey: .role)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(application, forKey: .application)
        try container.encode(webhookIds, forKey: .webhookIds)
        try container.encode(role, forKey: .role)
        
        try super.encode(to: encoder)
    }
    
    public enum CodingKeys:CodingKey{
        case application
        case webhookIds
        case role
    }
    
}
