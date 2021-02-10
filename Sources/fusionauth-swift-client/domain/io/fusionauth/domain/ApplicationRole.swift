//
//  ApplicationRole.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new Application Role Object.
 */

public class ApplicationRole:Codable{
    public var description:String? = nil
    public var id:UUID? = nil
    public var insertIntant:Date? = nil
    public var isDefault:Bool? = nil
    public var isSuperRole:Bool? = nil
    public var lastUpdateInstant:Date? = nil
    public var name:String? = nil
    
    public init(description: String? = nil, id: UUID? = nil, insertIntant: Date? = nil, isDefault: Bool? = nil, isSuperRole: Bool? = nil, lastUpdateInstant: Date? = nil, name: String? = nil) {
        self.description = description
        self.id = id
        self.insertIntant = insertIntant
        self.isDefault = isDefault
        self.isSuperRole = isSuperRole
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
    }
}
