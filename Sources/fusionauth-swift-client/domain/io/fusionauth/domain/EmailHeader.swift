//
//  File.swift
//  
//
//  Created by Everaldlee Johnson on 12/19/21.
//

import Foundation

public class EmailHeader:Codable{

    public var name:String?
    public var value:String?
    
    public init(name: String? = nil, value: String? = nil) {
        self.name = name
        self.value = value
    }
}
