//
//  AuditLogSearchResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct AuditLogSearchResponse:Codable {
    public var auditLogs:[AuditLog]?
    public var total:UInt64?


    public init(auditLogs: [AuditLog]? = nil, total: UInt64? = nil) {
        self.auditLogs = auditLogs
        self.total = total
    }
}
