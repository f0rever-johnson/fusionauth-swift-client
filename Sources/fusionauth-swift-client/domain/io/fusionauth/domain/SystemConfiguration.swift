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
    public var cookieEncryptionIV:String? = nil
    public var cookieEncryptionKey:String? = nil
    public var corsConfiguration:CORSConfiguration? = nil
    public var data:[String:JSONObject]? = nil
    public var eventLogConfiguration:EventLogConfiguration? = nil
    public var loginRecordConfiguration:LoginRecordConfiguration? = nil
    public var reportTimezone:String? = nil
    public var uiConfiguration:UIConfiguration? = nil

    public init(auditLogConfiguration: AuditLogConfiguration? = nil, cookieEncryptionIV: String? = nil, cookieEncryptionKey: String? = nil, corsConfiguration: CORSConfiguration? = nil, data: [String:JSONObject]? = nil, eventLogConfiguration: EventLogConfiguration? = nil, loginRecordConfiguration: LoginRecordConfiguration? = nil, reportTimezone: String? = nil, uiConfiguration: UIConfiguration? = nil) {
        self.auditLogConfiguration = auditLogConfiguration
        self.cookieEncryptionIV = cookieEncryptionIV
        self.cookieEncryptionKey = cookieEncryptionKey
        self.corsConfiguration = corsConfiguration
        self.data = data
        self.eventLogConfiguration = eventLogConfiguration
        self.loginRecordConfiguration = loginRecordConfiguration
        self.reportTimezone = reportTimezone
        self.uiConfiguration = uiConfiguration
    }

}
