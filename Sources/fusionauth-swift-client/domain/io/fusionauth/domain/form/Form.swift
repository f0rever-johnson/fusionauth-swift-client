//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class Form:Codable{
    public var data:[String:JSONObject]? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var name:String? = nil
    public var steps:[FormStep]? = nil
    public var type:FormType? = nil
    
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
