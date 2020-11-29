//
//  AuditLogExportRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class AuditLogExportRequest:BaseExportRequest, Codable{
    public var dateTimeSecondsFormat: String? = nil
    public var zoneId: String? = nil
    public var criteria:AuditLogSearchCriteria? = nil

    public init(dateTimeSecondsFormat: String? = nil, zoneId: String? = nil, criteria: AuditLogSearchCriteria? = nil) {
        self.dateTimeSecondsFormat = dateTimeSecondsFormat
        self.zoneId = zoneId
        self.criteria = criteria
    }

}
