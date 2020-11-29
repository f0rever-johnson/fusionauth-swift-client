//
//  LoginRecordExportRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
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
