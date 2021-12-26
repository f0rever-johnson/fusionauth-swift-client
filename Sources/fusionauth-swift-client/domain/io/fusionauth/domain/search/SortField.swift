//
//  SortField.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Application Role Object.
 */

public class SortField:Codable{
    public var name:String?
    public var missing:String?
    public var order:Sort?

    public init(name: String? = nil, missing: String? = nil, order: Sort? = nil) {
        self.name = name
        self.missing = missing
        self.order = order
    }

}
