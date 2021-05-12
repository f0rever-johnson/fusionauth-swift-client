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
    public var numberOfResults: Int? = nil
    public var orderBy: String? = nil
    public var startRow: Int? = nil
    public var end:Date? = nil
    public var message:String? = nil
    public var start:Date? = nil
    public var user:String? = nil

    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, end: Date? = nil, message: String? = nil, start: Date? = nil, user: String? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.end = end
        self.message = message
        self.start = start
        self.user = user
    }

}
