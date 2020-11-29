//
//  Count.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct Count:Codable{
    public var count:Int? = nil
    public var interval:Int? = nil

    public init(count: Int? = nil, interval: Int? = nil) {
        self.count = count
        self.interval = interval
    }

}
