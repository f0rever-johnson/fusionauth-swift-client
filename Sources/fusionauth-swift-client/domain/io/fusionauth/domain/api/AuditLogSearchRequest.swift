//
//  AuditLogSearchRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct AuditLogSearchRequest:Codable {
    public var search:AuditLogSearchCriteria? = nil


    public init(search: AuditLogSearchCriteria? = nil) {
        self.search = search
    }
}
