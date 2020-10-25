//
//  InvtervalUser.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class IntervalUser:Codable{
    public var applicationId:UUID? = nil
    public var period:Int? = nil
    public var userId:UUID? = nil

    public init(applicationId: UUID? = nil, period: Int? = nil, userId: UUID? = nil) {
        self.applicationId = applicationId
        self.period = period
        self.userId = userId
    }
}
