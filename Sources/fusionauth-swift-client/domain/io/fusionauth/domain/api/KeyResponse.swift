//
//  KeyResponse.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class KeyResponse:Codable{
    public var key:Key? = nil
    public var keys:[Key]? = nil

    public init(key: Key? = nil, keys: [Key]? = nil) {
        self.key = key
        self.keys = keys
    }

}
