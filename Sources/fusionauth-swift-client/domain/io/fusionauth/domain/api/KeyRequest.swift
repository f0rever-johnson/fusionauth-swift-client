//
//  KeyRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation


public class KeyRequest:Codable{
    public var key:Key? = nil

    public init(key: Key? = nil) {
        self.key = key
    }

}
