//
//  LoginRecordExportRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public struct LoginRecordExportRequest:BaseExportRequest, Codable{
    public var dateTimeSecondsFormat: String? = nil
    public var zoneId: String? = nil
    public var criteria:LoginRecordSearchCriteria? = nil

    public init(dateTimeSecondsFormat: String? = nil, zoneId: String? = nil, criteria: LoginRecordSearchCriteria? = nil) {
        self.dateTimeSecondsFormat = dateTimeSecondsFormat
        self.zoneId = zoneId
        self.criteria = criteria
    }
}
