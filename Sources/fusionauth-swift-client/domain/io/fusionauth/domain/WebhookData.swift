//
//  WebhookData.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class WebhookData:Codable{
    
    public var eventsEnabled:[EventType:Bool]? = nil

    public init(eventsEnabled: [EventType:Bool]? = nil) {
        self.eventsEnabled = eventsEnabled
    }
}
