//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/3/21.
//

import Foundation

public class KafkaMessengerConfiguration:BaseMessengerConfiguration{

    public var defaultTopic:String? = nil
    public var producer:[String:String]? = nil
    
    public init(data: [String : JSONObject]? = nil, debug: Bool? = nil, id: UUID? = nil, insertInstant: Date? = nil, lastUpdateInstant: Date? = nil, name: String? = nil, transport: String? = nil, type: MessengerType? = nil, defaultTopic: String? = nil, producer: [String : String]? = nil) {
        
        self.defaultTopic = defaultTopic
        self.producer = producer
        super.init(data: data, debug: debug, id: id, insertInstant: insertInstant, lastUpdateInstant: lastUpdateInstant, name: name, transport: transport, type: type)
    }
    
    required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        defaultTopic = try container.decode(String.self, forKey: .defaultTopic)
        defaultTopic = try container.decode(String.self, forKey: .producer)
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
       case defaultTopic
        case producer
    }
}
