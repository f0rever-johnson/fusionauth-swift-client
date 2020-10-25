//
//  Count.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
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
