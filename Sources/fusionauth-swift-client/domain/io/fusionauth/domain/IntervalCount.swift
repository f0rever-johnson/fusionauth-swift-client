//
//  InvervalCount.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class IntervalCount:Codable{
    public var applicationId:UUID?
    public var count:Int?
    public var decrementedCount:Int?
    public var period:Int?

    public init(applicationId: UUID? = nil, count: Int? = nil, decrementedCount: Int? = nil, period: Int? = nil) {
        self.applicationId = applicationId
        self.count = count
        self.decrementedCount = decrementedCount
        self.period = period
    }
}
