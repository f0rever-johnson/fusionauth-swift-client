//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class EmailUnverifiedOptions:Codable{

    public var allowEmailChangeWhenGated:Bool? = nil
    public var behavior:UnverifiedBehavior? = nil
    
    public init(allowEmailChangeWhenGated: Bool? = nil, behavior: UnverifiedBehavior? = nil) {
        self.allowEmailChangeWhenGated = allowEmailChangeWhenGated
        self.behavior = behavior
    }
}
