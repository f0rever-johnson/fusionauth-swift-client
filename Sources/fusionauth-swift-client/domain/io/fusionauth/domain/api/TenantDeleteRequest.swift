//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class TenantDeleteRequest:BaseEventRequest{

    public var async:Bool?
    
    
    public init(async: Bool? = nil, eventInfo: EventInfo? = nil) {
        self.async = async
        super.init(eventInfo:eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.async = try container.decode(Bool.self, forKey: .async)
        
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case async
    }
}
