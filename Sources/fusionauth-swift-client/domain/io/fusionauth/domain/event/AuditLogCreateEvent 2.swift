//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public struct AuditLogCreateEvent:BaseEvent, Codable{
  
    public var id: UUID?
    public var info: EventInfo?
    public var tenantId: UUID?
    public var type: EventType?
    public var auditLog:AuditLog?
    
    public init(id: UUID? = nil, info: EventInfo? = nil, tenantId: UUID? = nil, type: EventType? = nil, auditLog: AuditLog? = nil) {
        self.id = id
        self.info = info
        self.tenantId = tenantId
        self.type = type
        self.auditLog = auditLog
    }
    
}
