//
//  EventConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Event Configuration Object.
 */

public struct EventConfiguration:Codable {
    public var events:[String:EventConfigurationData]?

    public init(events: [String:EventConfigurationData]? = nil) {
        self.events = events
    }

}

