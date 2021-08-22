//
//  AuditLogSearchCriteria.swift
//  
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Audit Log Search Criteria Object.
 */

public class AuditLogSearchCriteria:BaseSearchCriteria, Codable {
    public var numberOfResults: Int?
    public var orderBy: String?
    public var startRow: Int?
    public var end:Date?
    public var message:String?
    public var newValue:String?
    public var oldValue:String?
    public var reason:String?
    public var start:Date?
    public var user:String?

    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, end: Date? = nil, message: String? = nil, newValue: String? = nil, oldValue: String? = nil, reason: String? = nil, start: Date? = nil, user: String? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.end = end
        self.message = message
        self.newValue = newValue
        self.oldValue = oldValue
        self.reason = reason
        self.start = start
        self.user = user
    }

}
