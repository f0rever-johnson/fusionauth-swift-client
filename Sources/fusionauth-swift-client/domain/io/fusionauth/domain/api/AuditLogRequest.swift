//
//  AuditLogRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct AuditLogRequest:Codable {
    public var  auditLog:AuditLog? = nil

    public init(auditLog: AuditLog? = nil) {
        self.auditLog = auditLog
    }

}
