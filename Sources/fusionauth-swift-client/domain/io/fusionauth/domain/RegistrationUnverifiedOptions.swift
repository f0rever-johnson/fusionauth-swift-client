//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class RegistrationUnverifiedOptions:Codable{

    public var behavior:UnverifiedBehavior? = nil
    
    public init(behavior: UnverifiedBehavior? = nil) {
        self.behavior = behavior
    }
}
