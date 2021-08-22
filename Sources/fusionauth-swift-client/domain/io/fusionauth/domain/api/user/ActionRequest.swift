//
//  ActionRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public class ActionRequest:BaseEventRequest{
    public var action:ActionData? = nil
    public var broadcast:Bool? = nil

    public init(action: ActionData? = nil, broadcast: Bool? = nil, eventInfo: EventInfo? = nil) {
        self.action = action
        self.broadcast = broadcast
        super.init(eventInfo: eventInfo)
    }
    
    public required init(from decoder: Decoder) throws {
        
        // Get our container for this subclass' coding keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(ActionData.self, forKey: .action)
        self.broadcast = try container.decode(Bool.self, forKey: .broadcast)
        
        
        // Get superDecoder for superclass and call super.init(from:) with it
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
        
    }
    
    private enum CodingKeys:CodingKey{
        case action
        case broadcast
    }

}
