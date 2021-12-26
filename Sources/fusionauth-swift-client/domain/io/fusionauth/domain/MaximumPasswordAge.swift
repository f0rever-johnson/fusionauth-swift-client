//
//  MaximumPasswordAge.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Maximum Password Age Object.
 */

public struct MaximumPasswordAge:Enableable, Codable {
    public var enabled:Bool?
    public var days:Int?

    public init(enabled: Bool? = nil, days: Int? = nil) {
        self.enabled = enabled
        self.days = days
    }

}
