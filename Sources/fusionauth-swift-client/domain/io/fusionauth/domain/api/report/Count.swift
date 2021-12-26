//
//  Count.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct Count:Codable{
    public var count:Int?
    public var interval:Int?

    public init(count: Int? = nil, interval: Int? = nil) {
        self.count = count
        self.interval = interval
    }

}
