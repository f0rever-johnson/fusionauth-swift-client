//
//  InvervalCount.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class IntervalCount:Codable{
    public var applicationId:UUID? = nil
    public var count:Int? = nil
    public var decrementedCount:Int? = nil
    public var period:Int? = nil

    public init(applicationId: UUID? = nil, count: Int? = nil, decrementedCount: Int? = nil, period: Int? = nil) {
        self.applicationId = applicationId
        self.count = count
        self.decrementedCount = decrementedCount
        self.period = period
    }
}
