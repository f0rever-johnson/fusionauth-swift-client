//
//  TimeBasedDeletePolicy.swift
//  
//
//  Created by Everaldlee Johnson on 11/29/20.
//

import Foundation

public class TimeBasedDeletePolicy:Codable, Enableable{
    public var numberofDaysToRetain:Int? = nil
    public var enabled: Bool? = nil
    
    public init(numberofDaysToRetain:Int? = nil, enabled:Bool? = nil){
        self.numberofDaysToRetain = numberofDaysToRetain
        self.enabled = enabled
    }
    
}
