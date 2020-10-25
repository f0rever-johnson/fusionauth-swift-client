//
//  AuditLogSearchResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct AuditLogSearchResponse:Codable {
    public var auditLogs:[AuditLog]? = nil
    public var total:UInt64? = nil


    public init(auditLogs: [AuditLog]? = nil, total: UInt64? = nil) {
        self.auditLogs = auditLogs
        self.total = total
    }
}
