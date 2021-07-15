//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class UniqueUsernameConfiguration:Codable{

    public var numberOfDigits:Int? = nil
    public var separator:String? = nil
    public var strategy:UniqueUsernameStrategy? = nil
    
    public init(numberOfDigits: Int? = nil, separator: String? = nil, strategy: UniqueUsernameStrategy? = nil) {
        self.numberOfDigits = numberOfDigits
        self.separator = separator
        self.strategy = strategy
    }
    
}
