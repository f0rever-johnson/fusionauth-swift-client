//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class BaseMessengerConfiguration:Codable{
   
    public var data:[String:JSONObject]?
    public var debug:Bool?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    public var transport:String?
    public var type:MessengerType?
    
    public init(data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, transport: String? = nil, type: MessengerType? = nil) {
         self.data = data
         self.debug = debug
         self.id = id
         self.insertInstant = insertInstant
         self.lastUpdateInstant = lastUpdateInstant
         self.name = name
         self.transport = transport
         self.type = type
     }
     
}
