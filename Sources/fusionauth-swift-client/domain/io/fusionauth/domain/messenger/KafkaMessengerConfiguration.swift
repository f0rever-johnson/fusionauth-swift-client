//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/3/21.
//

import Foundation

public class KafkaMessengerConfiguration:BaseMessengerConfigurationProtocol{

    public var data: [String : JSONObject]? = nil
    public var debug: Bool? = nil
    public var id: UUID? = nil
    public var insertInstant: Date? = nil
    public var lastUpdateInstant: Date? = nil
    public var name: String? = nil
    public var transport: String? = nil
    public var type: MessengerType? = nil
    public var defaultTopic:String? = nil
    public var producer:[String:String]? = nil
    
    public init(data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, transport: String? = nil, type: MessengerType? = nil, defaultTopic: String? = nil, producer: [String : String]? = nil) {
        self.data = data
        self.debug = debug
        self.id = id
        self.insertInstant = insertInstant
        self.lastUpdateInstant = lastUpdateInstant
        self.name = name
        self.transport = transport
        self.type = type
        self.defaultTopic = defaultTopic
        self.producer = producer
    }

}
