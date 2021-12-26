//
//  SystemConfigurationRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct SystemConfigurationRequest:Codable {
    public var systemConfiguration:SystemConfiguration?

    public init(systemConfiguration: SystemConfiguration? = nil) {
        self.systemConfiguration = systemConfiguration
    }

}
