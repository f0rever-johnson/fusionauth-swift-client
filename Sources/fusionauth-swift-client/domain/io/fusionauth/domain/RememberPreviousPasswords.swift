//
//  RememberPreviousPasswords.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Remember Previous Passwords Object.
 */

public struct RememberPreviousPasswords:Enableable, Codable {
    public var enabled:Bool? = nil
    public var count:Int? = nil

    public init(enabled: Bool? = nil, count: Int? = nil) {
        self.enabled = enabled
        self.count = count
    }

}
