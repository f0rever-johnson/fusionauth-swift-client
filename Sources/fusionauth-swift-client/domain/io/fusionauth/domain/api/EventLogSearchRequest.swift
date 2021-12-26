//
//  EventLogSearchRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct EventLogSearchRequest:Codable{
    public var search:EventLogSearchCriteria?

    public init(search: EventLogSearchCriteria? = nil) {
        self.search = search
    }
}
