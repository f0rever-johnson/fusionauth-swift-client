//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/29/21.
//

import Foundation

///  Models a specific entity type permission. This permission can be granted to users or other entities.
public class EntityTypePermission:Codable{
    
    public var date:[String:JSONObject]? = nil
    public var description:String? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var isDefault:Bool? = nil
    public var lastUpdateInstant:Date? = nil
    public var name:String? = nil
    
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
