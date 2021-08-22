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
    
    public var auditLogConfiguration:AuditLogConfiguration?
    public var CORSConfiguration:CORSConfiguration?
    public var data:[String:JSONObject]?
    public var eventLogConfiguration:EventLogConfiguration?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var loginRecordConfiguration:LoginRecordConfiguration?
    public var reportTimezone:String?
    public var ssoConfiguration:SystemSSOConfiguration?
    public var uiConfiguration:UIConfiguration?
    
    public init(auditLogConfiguration: AuditLogConfiguration? = nil, CORSConfiguration: CORSConfiguration? = nil, data: [String : JSONObject]? = nil, eventLogConfiguration: EventLogConfiguration? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, loginRecordConfiguration: LoginRecordConfiguration? = nil, reportTimezone: String? = nil, ssoConfiguration: SystemSSOConfiguration? = nil, uiConfiguration: UIConfiguration? = nil) {
        self.auditLogConfiguration = auditLogConfiguration
        self.CORSConfiguration = CORSConfiguration
        self.data = data
        self.eventLogConfiguration = eventLogConfiguration
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.loginRecordConfiguration = loginRecordConfiguration
        self.reportTimezone = reportTimezone
        self.ssoConfiguration = ssoConfiguration
        self.uiConfiguration = uiConfiguration
    }

}
