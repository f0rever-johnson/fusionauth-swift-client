//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///  Models a specific entity type permission. This permission can be granted to users or other entities.
public struct EntityTypePermission:Codable{
    
    public var date:[String:JSONObject]?
    public var description:String?
    public var id:UUID?
    public var insertInstant:Date?
    public var isDefault:Bool?
    public var lastUpdateInstant:Date?
    public var name:String?
    
    public init(date: [String : JSONObject]? = nil, description: String? = nil, id: UUID? = nil, insertInstant: Date? = nil, isDefault: Bool? = nil, lastUpdateInstant: Date? = nil, name: String? = nil) {
        self.date = date
        self.description = description
        self.id = id
        self.insertInstant = insertInstant
        self.isDefault = isDefault
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
    }
    
}
