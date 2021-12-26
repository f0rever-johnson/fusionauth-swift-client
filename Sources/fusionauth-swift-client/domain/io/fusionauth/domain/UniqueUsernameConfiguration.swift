//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 5/12/21.
//

import Foundation

public class UniqueUsernameConfiguration:Codable{

    public var numberOfDigits:Int?
    public var separator:String?
    public var strategy:UniqueUsernameStrategy?
    
    public init(numberOfDigits: Int? = nil, separator: String? = nil, strategy: UniqueUsernameStrategy? = nil) {
        self.numberOfDigits = numberOfDigits
        self.separator = separator
        self.strategy = strategy
    }
    
}
