//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/21/21.
//

import Foundation

public class UserDeleteSingleRequest:BaseEventRequest{
  
    public var hardDelete:Bool?
    
    public init(eventInfo: EventInfo? = nil, hardDelete: Bool? = nil) {
        self.hardDelete = hardDelete
        
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hardDelete = try container.decode(Bool.self, forKey: .hardDelete)
        
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    override public func encode(to encoder: Encoder) throws {
            
        var container = encoder.container(keyedBy: CodingKeys.self)
            
        try container.encode(hardDelete, forKey: .hardDelete)
                
        try super.encode(to: encoder)
    }
    
    private enum CodingKeys:CodingKey{
        case hardDelete
    }
}
