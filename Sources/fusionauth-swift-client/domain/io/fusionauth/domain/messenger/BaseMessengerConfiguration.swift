//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 4/30/21.
//

import Foundation

public class BaseMessengerConfiguration:Codable{
   
    public var data:[String:JSONObject]? = nil
    public var debug:Bool? = nil
    public var id:UUID? = nil
    public var insertInstant:Date? = nil
    public var lastUpdateInstant:Date? = nil
    public var name:String? = nil
    public var transport:String? = nil
    public var type:MessengerType? = nil
    
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
