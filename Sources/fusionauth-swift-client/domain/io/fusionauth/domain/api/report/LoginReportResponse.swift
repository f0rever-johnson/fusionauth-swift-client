//
//  LoginReportResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//
import Foundation

public struct LoginReportResponse:Codable{
    public var hourlyCounts:[Count]? = nil
    public var total:UInt64? = nil

    public init(hourlyCounts: [Count]? = nil, total: UInt64? = nil) {
        self.hourlyCounts = hourlyCounts
        self.total = total
    }

}
