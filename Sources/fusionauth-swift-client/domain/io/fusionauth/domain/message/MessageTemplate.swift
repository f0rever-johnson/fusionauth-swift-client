//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class MessageTemplate:Codable{

    public var data:[String:JSONObject]?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    public var type:MessageType?
    
    public init(data: [String : JSONObject]? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, type: MessageType? = nil) {
        self.data = data
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.type = type
    }
}
