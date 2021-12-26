//
//  LoginRecordsSearchCriteria.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class LoginRecordSearchCriteria:BaseSearchCriteria,Codable{
    public var numberOfResults: Int?
    public var orderBy: String?
    public var startRow: Int?
    public var applicationId:UUID?
    public var end:Date?
    public var start:Date?
    public var userId:UUID?

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
