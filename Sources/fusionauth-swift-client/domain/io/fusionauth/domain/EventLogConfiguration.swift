//
//  EventLogConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class EventLogConfiguration:Codable{
    public var numberToRetain:Int? = nil

    public init(numberToRetain: Int? = nil) {
        self.numberToRetain = numberToRetain
    }

}
