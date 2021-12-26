//
//  InvtervalUser.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//          

import Foundation


public class IntervalUser:Codable{
    public var applicationId:UUID?
    public var period:Int?
    public var userId:UUID?

    public init(applicationId: UUID? = nil, period: Int? = nil, userId: UUID? = nil) {
        self.applicationId = applicationId
        self.period = period
        self.userId = userId
    }
}
