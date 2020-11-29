//
//  SystemConfigurationResponse.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct SystemConfigurationResponse:Codable {
    public var systemConfiguration:SystemConfiguration? = nil

    public init(systemConfiguration: SystemConfiguration? = nil) {
        self.systemConfiguration = systemConfiguration
    }

}
