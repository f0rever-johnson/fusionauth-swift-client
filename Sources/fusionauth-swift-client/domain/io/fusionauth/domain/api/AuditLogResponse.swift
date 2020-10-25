//
//  AuditLogResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct AuditLogResponse:Codable {
    public var auditLog:AuditLog? = nil


    public init(auditLog: AuditLog? = nil) {
        self.auditLog = auditLog
    }
}
