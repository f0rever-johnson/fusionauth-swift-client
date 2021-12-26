//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class Form:Codable{
    public var data:[String:JSONObject]?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    public var steps:[FormStep]?
    public var type:FormType?
    
    public init(data: [String : JSONObject]? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, steps: [FormStep]? = nil, type: FormType? = nil) {
        self.data = data
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.steps = steps
        self.type = type
    }
}
