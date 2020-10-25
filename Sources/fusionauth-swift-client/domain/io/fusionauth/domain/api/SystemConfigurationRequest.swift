//
//  SystemConfigurationRequest.swift
//
//
//  Created by Everaldlee Johnson on 10/25/20.
//

import Foundation

public struct SystemConfigurationRequest:Codable {
    public var systemConfiguration:SystemConfiguration? = nil

    public init(systemConfiguration: SystemConfiguration? = nil) {
        self.systemConfiguration = systemConfiguration
    }

}
