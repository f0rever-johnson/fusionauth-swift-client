//
//  MonthlyActiveUserReportResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
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
