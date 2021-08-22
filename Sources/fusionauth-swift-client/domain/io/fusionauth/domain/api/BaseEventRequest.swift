//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 8/17/21.
//

import Foundation


public class BaseEventRequest:Codable{
 
    public var eventInfo:EventInfo?
    
    public init(eventInfo: EventInfo? = nil) {
        self.eventInfo = eventInfo
    }
}
