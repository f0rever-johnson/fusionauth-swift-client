//
//  SystemConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new System Configuration Object.
 */

public struct SystemConfiguration:Codable {
    public var auditLogConfiguration:AuditLogConfiguration? = nil
    public var CORSConfiguration:CORSConfiguration? = nil
    public var data:[String:JSONObject]? = nil
    public var eventLogConfiguration:EventLogConfiguration? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var loginRecordConfiguration:LoginRecordConfiguration? = nil
    public var reportTimezone:String? = nil
    public var uiConfiguration:UIConfiguration? = nil
    
    public init(auditLogConfiguration: AuditLogConfiguration? = nil, CORSConfiguration: CORSConfiguration? = nil, data: [String : JSONObject]? = nil, eventLogConfiguration: EventLogConfiguration? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, loginRecordConfiguration: LoginRecordConfiguration? = nil, reportTimezone: String? = nil, uiConfiguration: UIConfiguration? = nil) {
        self.auditLogConfiguration = auditLogConfiguration
        self.CORSConfiguration = CORSConfiguration
        self.data = data
        self.eventLogConfiguration = eventLogConfiguration
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.loginRecordConfiguration = loginRecordConfiguration
        self.reportTimezone = reportTimezone
        self.uiConfiguration = uiConfiguration
    }

}
