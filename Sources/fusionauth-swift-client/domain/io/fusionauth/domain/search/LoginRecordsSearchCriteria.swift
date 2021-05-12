//
//  LoginRecordsSearchCriteria.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class LoginRecordSearchCriteria:BaseSearchCriteria,Codable{
    public var numberOfResults: Int? = nil
    public var orderBy: String? = nil
    public var startRow: Int? = nil
    public var applicationId:UUID? = nil
    public var end:Date? = nil
    public var start:Date? = nil
    public var userId:UUID? = nil

    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, applicationId: UUID? = nil, end: Date? = nil, start: Date? = nil, userId: UUID? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.applicationId = applicationId
        self.end = end
        self.start = start
        self.userId = userId
    }
}
