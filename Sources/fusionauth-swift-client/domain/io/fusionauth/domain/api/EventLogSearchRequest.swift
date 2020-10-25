//
//  EventLogSearchRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct EventLogSearchRequest:Codable{
    public var search:EventLogSearchCriteria? = nil

    public init(search: EventLogSearchCriteria? = nil) {
        self.search = search
    }
}
