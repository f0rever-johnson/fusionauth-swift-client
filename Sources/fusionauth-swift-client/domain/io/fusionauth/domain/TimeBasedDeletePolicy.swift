//
//  TimeBasedDeletePolicy.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class TimeBasedDeletePolicy:Codable, Enableable{
    public var numberofDaysToRetain:Int?
    public var enabled: Bool?
    
    public init(numberofDaysToRetain:Int? = nil, enabled:Bool? = nil){
        self.numberofDaysToRetain = numberofDaysToRetain
        self.enabled = enabled
    }
    
}
