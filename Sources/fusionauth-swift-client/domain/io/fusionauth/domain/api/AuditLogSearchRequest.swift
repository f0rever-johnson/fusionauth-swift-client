//
//  AuditLogSearchRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation


public struct AuditLogSearchRequest:Codable {
    public var search:AuditLogSearchCriteria?


    public init(search: AuditLogSearchCriteria? = nil) {
        self.search = search
    }
}
