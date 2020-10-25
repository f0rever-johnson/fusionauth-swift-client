//
//  DailyActiveUserReportResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
