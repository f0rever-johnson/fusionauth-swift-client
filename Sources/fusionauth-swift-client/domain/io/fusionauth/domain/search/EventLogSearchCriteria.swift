//
//  EventLogSearchCriteria.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class EventLogSearchCriteria:BaseSearchCriteria, Codable{
    public var numberOfResults: Int?
    public var orderBy: String?
    public var startRow: Int?
    public var end:Date?
    public var message:String?
    public var start:Date?
    public var type:EventLogType?

    public init(numberOfResults: Int? = nil, orderBy: String? = nil, startRow: Int? = nil, end: Date? = nil, message: String? = nil, start: Date? = nil, type: EventLogType? = nil) {
        self.numberOfResults = numberOfResults
        self.orderBy = orderBy
        self.startRow = startRow
        self.end = end
        self.message = message
        self.start = start
        self.type = type
    }

}
