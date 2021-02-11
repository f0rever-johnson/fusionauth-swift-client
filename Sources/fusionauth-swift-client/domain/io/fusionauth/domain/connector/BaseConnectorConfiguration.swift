//
//  BaseConnectorConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class BaseConnectorConfiguration:Codable{
    public var data:JSONObject
    public var debug:Bool?
    public var id:UUID?
    public var insertInstant:Date?
    public var lastUpdateInstant:Date?
    public var name:String?
    public var type:ConnectorType
    
    public init(data: JSONObject, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, type: ConnectorType) {
        self.data = data
        self.debug = debug
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.type = type
    }
    
}
