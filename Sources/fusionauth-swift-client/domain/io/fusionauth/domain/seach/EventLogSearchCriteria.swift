//
//  EventLogSearchCriteria.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class EventLogSearchCriteria:BaseSearchCriteria, Codable{
    public var numberOfResults: Int? = nil
    public var orderBy: String? = nil
    public var startRow: Int? = nil
    public var end:Date? = nil
    public var message:String? = nil
    public var start:Date? = nil
    public var type:EventLogType? = nil

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
