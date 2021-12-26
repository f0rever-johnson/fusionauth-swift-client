//
//  KeyRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/12/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class KeyRequest:Codable{
    public var key:Key?

    public init(key: Key? = nil) {
        self.key = key
    }

}
