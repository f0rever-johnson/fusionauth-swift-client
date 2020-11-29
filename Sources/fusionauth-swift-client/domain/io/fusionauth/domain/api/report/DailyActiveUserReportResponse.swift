//
//  DailyActiveUserReportResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct DailyActiveUserReportResponse:Codable {
    public var dailyActiveUsers:[Count]? = nil
    public var total:UInt64? = nil


    public init(dailyActiveUsers: [Count]? = nil, total: UInt64? = nil) {
        self.dailyActiveUsers = dailyActiveUsers
        self.total = total
    }
}
