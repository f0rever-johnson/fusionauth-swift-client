//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation

public struct IPAccessControlList:Codable{
    
    public var data:[String:JSONObject]?
    public var entries:[IPAccessControlEntry]?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    
    public init(data: [String : JSONObject]? = nil, entries: [IPAccessControlEntry]? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil) {
        self.data = data
        self.entries = entries
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
    }
}
