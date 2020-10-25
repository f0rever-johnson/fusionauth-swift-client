//
//  MonthlyActiveUserReportResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct MonthlyActiveUserReportResponse:Codable {
    public var monthlyActiveUsers:[Count]? = nil
    public var total:UInt64? = nil

    public init(monthlyActiveUsers: [Count]? = nil, total: UInt64? = nil) {
        self.monthlyActiveUsers = monthlyActiveUsers
        self.total = total
    }
}
