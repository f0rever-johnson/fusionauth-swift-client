//
//  KeyResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
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
