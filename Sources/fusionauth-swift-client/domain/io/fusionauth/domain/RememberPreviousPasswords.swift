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
    public var enabled:Bool?
    public var count:Int?

    public init(enabled: Bool? = nil, count: Int? = nil) {
        self.enabled = enabled
        self.count = count
    }

}
