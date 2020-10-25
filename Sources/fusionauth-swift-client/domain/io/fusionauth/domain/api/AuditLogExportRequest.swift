//
//  AuditLogExportRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
