//
//  TotalsReportResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
