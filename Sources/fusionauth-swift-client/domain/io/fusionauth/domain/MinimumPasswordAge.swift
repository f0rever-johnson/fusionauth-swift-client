//
//  MinimumPasswordAge.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Minimum Password Age Object.
 */

public struct MinimumPasswordAge:Enableable, Codable {
    public var enabled:Bool? = nil
    public var seconds:Int? = nil

    public init(enabled: Bool? = nil, seconds: Int? = nil) {
        self.enabled = enabled
        self.seconds = seconds
    }

}
