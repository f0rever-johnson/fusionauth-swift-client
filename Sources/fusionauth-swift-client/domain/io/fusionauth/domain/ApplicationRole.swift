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
    public var description:String?
    public var id:UUID?
    public var insertIntant:Date?
    public var isDefault:Bool?
    public var isSuperRole:Bool?
    public var lastUpdateInstant:Date?
    public var name:String? 
    
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
