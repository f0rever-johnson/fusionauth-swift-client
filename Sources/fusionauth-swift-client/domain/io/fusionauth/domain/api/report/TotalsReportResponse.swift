//
//  TotalsReportResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct TotalsReportResponse:Codable{
    public var applicationTotals:[UUID:Totals]? = nil
    public var globalRegistrations:UInt64? = nil
    public var totalGlobalRegistrations:UInt64? = nil

    public init(applicationTotals: [UUID:Totals]? = nil, globalRegistrations: UInt64? = nil, totalGlobalRegistrations: UInt64? = nil) {
        self.applicationTotals = applicationTotals
        self.globalRegistrations = globalRegistrations
        self.totalGlobalRegistrations = totalGlobalRegistrations
    }

}
