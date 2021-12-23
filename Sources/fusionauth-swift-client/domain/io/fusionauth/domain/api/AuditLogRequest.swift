//
//  AuditLogRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class AuditLogRequest:BaseEventRequest {
    public var  auditLog:AuditLog?

    public required init(auditLog: AuditLog? = nil, eventInfo:EventInfo? = nil) {
        self.auditLog = auditLog
        super.init(eventInfo: eventInfo)
    }

    
    required init(from decoder: Decoder) throws {
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        auditLog = try container.decode(AuditLog.self, forKey: .auditLog)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(auditLog, forKey: .auditLog)
        
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case auditLog
    }
    
}
