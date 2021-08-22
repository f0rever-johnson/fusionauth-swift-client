//
//  MetaData.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

/**
 * Creates a new MetaData Object.
 */

public struct MetaData:Codable{
    public var device:DeviceInfo?
    public var scopes:[String]?

    public init(device: DeviceInfo? = nil, scopes: [String]? = nil) {
        self.device = device
        self.scopes = scopes
    }
}
