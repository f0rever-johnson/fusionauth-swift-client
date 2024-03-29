//
//  IntegrationRequest.swift
//  FusionAuth Swift Client
//
//  Created by Everaldlee Johnson on 12/11/18.
//  Copyright © 2018 F0rever_Johnson. All rights reserved.
//

import Foundation

public struct IntegrationRequest:Codable {
    public var integrations:Integrations?

    public init(integrations: Integrations? = nil) {
        self.integrations = integrations
    }

}
