//
//  SecureGeneratorConfiguration.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class SecureGeneratorConfiguration:Codable{
    public var length:Int?
    public var type:SecureGeneratorType?

    public init(length: Int? = nil, type: SecureGeneratorType? = nil) {
        self.length = length
        self.type = type
    }

}
