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
    public var device:DeviceInfo? = nil
    public var scopes:[String]? = nil

    public init(device: DeviceInfo? = nil, scopes: [String]? = nil) {
        self.device = device
        self.scopes = scopes
    }
}
