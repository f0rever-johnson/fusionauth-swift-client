//
//  ReloadRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 11/9/19.
//  Copyright © 2019 F0rever_Johnson. All rights reserved.
//

import Foundation


public class ReloadRequest:Codable{
    public var names:[String]?

    public init(names: [String]? = nil) {
        self.names = names
    }

}
