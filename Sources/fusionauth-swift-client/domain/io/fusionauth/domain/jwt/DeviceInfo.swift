//
//  DeviceInfo.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation
import Network

/**
 * Creates a new Device Info Object.
 */

public struct DeviceInfo:Codable{
    public var description:String? 
    public var lastAccessedAddress:String?
    public var lastAccessedInstant:Date?
    public var name:String?
    public var deviceType:DeviceType?

    public init(description: String? = nil, lastAccessedAddress: String? = nil, lastAccessedInstant: Date? = nil, name: String? = nil, deviceType: DeviceType? = nil) {
        self.description = description
        self.lastAccessedAddress = lastAccessedAddress
        self.lastAccessedInstant = lastAccessedInstant
        self.name = name
        self.deviceType = deviceType
    }
}

