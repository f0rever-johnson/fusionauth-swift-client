//
//  DeleteConfiguration.swift
///
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public class DeleteConfiguration:Codable, Enableable{
    
    public var numberOfDaysToRetain:Int?
    public var enabled: Bool? 

    public init(numberOfDaysToRetain: Int? = nil, enabled: Bool? = nil) {
        self.numberOfDaysToRetain = numberOfDaysToRetain
        self.enabled = enabled
    }
}
