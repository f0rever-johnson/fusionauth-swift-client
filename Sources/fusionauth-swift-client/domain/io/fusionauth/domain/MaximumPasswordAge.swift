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
    public var enabled:Bool? = nil
    public var days:Int? = nil

    public init(enabled: Bool? = nil, days: Int? = nil) {
        self.enabled = enabled
        self.days = days
    }

}
