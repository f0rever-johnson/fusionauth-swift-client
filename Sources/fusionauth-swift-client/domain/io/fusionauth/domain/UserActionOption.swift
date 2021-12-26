//
//  UserActionOption.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new User Action Option Object
 */

public struct UserActionOption:Codable {
    public var localizedNames:LocalizedStrings?
    public var name:String?

    public init(localizedNames: LocalizedStrings? = nil, name: String? = nil) {
        self.localizedNames = localizedNames
        self.name = name
    }
}
